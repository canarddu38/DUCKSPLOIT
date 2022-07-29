using System;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace DSserver
{
    public class UDPSocket
    {
		public bool connected = false;
		public string clientip = "null";
        public Socket _socket = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
        public const int bufSize = 8 * 1024;
        public State state = new State();
        public EndPoint epFrom = new IPEndPoint(IPAddress.Any, 0);
        public AsyncCallback recv = null;

        public class State
        {
            public byte[] buffer = new byte[bufSize];
        }

        public void Server(string address, int port)
        {
            _socket.SetSocketOption(SocketOptionLevel.IP, SocketOptionName.ReuseAddress, true);
            _socket.Bind(new IPEndPoint(IPAddress.Parse(address), port));
            Receive();            
        }

        public void Client(string address, int port)
        {
            _socket.Connect(IPAddress.Parse(address), port);
            Receive();            
        }
        public void Send(string text)
        {
			_socket.EnableBroadcast = true;

			byte[] bytes = new byte[1024];
			bytes = Encoding.ASCII.GetBytes(text);
			_socket.SendTo(bytes,epFrom);
			
			
			
            // byte[] data = Encoding.ASCII.GetBytes(text);
            // _socket.BeginSend(data, 0, data.Length, SocketFlags.None, (ar) =>
            // {
                // State so = (State)ar.AsyncState;
                // int bytes = _socket.EndSend(ar);
                // Console.WriteLine("SEND: {0}, {1}", bytes, text);
            // }, state);
        }

        public void Receive()
        {            
            _socket.BeginReceiveFrom(state.buffer, 0, bufSize, SocketFlags.None, ref epFrom, recv = (ar) =>
            {
                State so = (State)ar.AsyncState;
                int bytes = _socket.EndReceiveFrom(ar, ref epFrom);
                _socket.BeginReceiveFrom(so.buffer, 0, bufSize, SocketFlags.None, ref epFrom, recv, so);
                Console.Write(Encoding.ASCII.GetString(so.buffer, 0, bytes));
				Console.Write("\n");
				clientip = epFrom.ToString();
				connected = true;
				
            }, state);
        }
		public void close()
        {            
            _socket.Close();
        }
    }
}