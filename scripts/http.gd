extends Node

var url = "https://script.google.com/macros/s/AKfycby4qRFC8m8Qa2ButIW3yKEJ9etQWDnEOWS1_5Csm27OV5hUh2PJcL5TykvI8pdk13w5YQ/exec"
@onready var http_request: HTTPRequest = $HTTPRequest

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	http_request.request_completed.connect(self._http_request_completed)
	
	pass # Replace with function body.

func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()

func send_data(data):
	var json = JSON.stringify(data)
	
	var response = http_request.request(url,[],HTTPClient.METHOD_POST,json)
	
	print(response)
	print(JSON.stringify(data))

# Called every frame. 'delta' is the elapsed time since the previous frame.
