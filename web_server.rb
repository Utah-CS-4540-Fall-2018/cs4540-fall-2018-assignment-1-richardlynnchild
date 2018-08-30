require 'socket'

class WebServer

    # Constructs new TCP Server on local host with
    # specified port. Default port is '1234'.
    def initialize(port=1234)
        @server = TCPServer.new('localhost',port)
    end





end