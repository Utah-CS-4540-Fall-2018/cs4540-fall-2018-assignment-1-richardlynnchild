# Assignment 1
# Richard Child
# uID: u0581030
# Github: richardlynnchild

# This is a simple server class that can be instantiated in other files.
# It will open a socket on the localhost at a specified port. Then it can
# listen for incoming clients on the specified port. The server will identify
# which browser the client is using and send a message back to the user.

require 'socket'

class WebServer

    # Constructs new TCP Server on local host with
    # specified port. Default port is '1234'.
    def initialize(port=1234)
        @server = TCPServer.new('localhost',port)
    end


    # Continuously istens for incoming clients, handles the request, constructs 
    # a response and sends the response. No parameters needed.
    def listen()
        loop do
            collect_request()
            create_response()
            write_response()
            
        end

    end

    # Creates a socket client by accepting the new server connection.
    # Collects the incoming request from the client and puts each header
    # and line into an array. No parameters needed.
    def collect_request()
        @socket = @server.accept
        @request_lines = []
        line = @socket.gets.strip
        while line != ''
            @request_lines << line
            line = @socket.gets.strip
        end
    end
        
    # Parses the incoming request information and pulls out the User-Agent
    # information. Then creates a HTTP OK response with a greeting message.
    def create_response()
        agent = ''
        @request_lines.each do |line|
            
            words = line.split
            if words[0] == "User-Agent:"
                agent = words[1]
            end
            
        end
        
        greeting = "You are using #{agent}\n"
        @response =  "HTTP/1.1 200 OK\r\n" +
                    "Content-Type: text/plain\r\n" +
                    "Content-Length: #{greeting.bytesize}\r\n" +
                    "Connection: close\r\n\r\n" + greeting

    end

    # Sends the response string back to the client and closes the socket.
    def write_response()
        @socket.print @response
        @socket.close

    end

end