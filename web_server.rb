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

    # Parses the incoming request from the client
    def collect_request()
        @socket = @server.accept
        @request_lines = []
        line = @socket.gets.strip
        while line != ''
            @request_lines << line
            line = @socket.gets.strip
        end
        




end