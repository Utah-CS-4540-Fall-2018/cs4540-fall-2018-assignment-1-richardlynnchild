require 'socket'

class WebServer

    # Constructs new TCP Server on local host with
    # specified port. Default port is '1234'.
    def initialize(port=1234)
        @server = TCPServer.new('localhost',port)
    end


    # Continuously istens for incoming clients, handles the request, constructs 
    # a response and sends the response.
    def listen()
        loop do
            collect_request()
            create_response()
            write_response()
            
        end

    end

    # Collects the incoming request from the client and puts each header
    # and line into an array.
    def collect_request()
        @socket = @server.accept
        @request_lines = []
        line = @socket.gets.strip
        while line != ''
            @request_lines << line
            line = @socket.gets.strip
        end
        
    # Parses the incoming request information and pulls out the User-Agent
    # information. The creates a HTTP OK response with the 'Hello' message.
    def create_response()
        @request_lines.each do |line|
            words = line.split
            if words[0] == "User-Agent:"
                agent = words[1]
            end
            
        end
        greeting = "Hello #{agent} user!\n"
        @response =  "HTTP/1.1 200 OK\r\n" +
                    "Content-Type: text/plain\r\n" +
                    "Content-Length: #{greeting.bytesize}\r\n" +
                    "Connection: close\r\n\r\n" + greeting

    end




end