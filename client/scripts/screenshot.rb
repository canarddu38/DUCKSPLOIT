class Screen

  EXT = :png
  PATH = '~/screenshots'

  # define path, extension and title (optional)
  # >> @screen = Screen.new '/path/to/file', :png, 'ScreenScrot'

  def initialize( path = PATH, ext = EXT, title = nil )
    @c, @path, @ext, @title, = 0, path.to_s, ext.to_s, ''
    @title += "#{title}_" unless title.nil?
    @title += "#{rand(999_999)}_000000"
    @filename = @path.to_s + @title.to_s
  end

  # record window, use :all to capture everything
  # >> @screen.capture(:all)

  def capture( screen = :window )
    screen = screen.to_sym == :all ? '' : '-u'
    exec = "scrot #{u} #{@filename + @c.to_s}.#{@ext}"
    system "#{exec}"
    @c += 1
  end
end

  puts "Start Recording Screenshots..."
  @screen = Screen.new
  system 'clear'
  puts "[Screenshot Recording Started]"

  str_time = Time.now

  # add recording time as argument, in seconds
  # default is 60

  max_time = ARGV.empty? ? 60 : ARGV[0].to_i

  until (Time.now - str_time).to_i >= max_time do
    @screen.capture
    # for slow terminal scripts add some sleep
    # sleep 0.1
  end

  puts "[Screenshot Recording Stopped] after #{(Time.now - str_time).to_f.round(2)} seconds"