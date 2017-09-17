package com.oneto.web.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

//이거 코드 어디있더라? 뭔가 상속 받는 클래스인거 같은데, jsdonjsf제이슨/?외부라이
//이 소스 어디서 복붙해왔어? 다시 보여줘
import javax.json.Json; //그게 왜 그런지 함 봐야지, 왜 빨간줄이 생기는지 라이브러리가 다른 라이브러리가 아닐까? 안 
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadsocket")
public class broadsocket {
	static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());

	@OnOpen
	public void handleOpen(Session userSession) {
		sessionUsers.add(userSession);
	};

	@OnMessage
	public void handleMessage(String message,Session userSession) throws IOException{
		String username = (String)userSession.getUserProperties().get("username");
		
		if(username == null){
			userSession.getUserProperties().put("username", message);
			//userSession.getBasicRemote().sendText(buildJsonData("System", "you are now connected as " + message));
			return;
		}
		Iterator<Session> iterator = sessionUsers.iterator();
		while(iterator.hasNext()){
			iterator.next().getBasicRemote().sendText(buildJsonData(username,message));
			}
	}
	@OnClose
	public void handleClose(Session userSession) {
		sessionUsers.remove(userSession);
	}

	public String buildJsonData(String username, String message) {
		//JsonObject jsonObject = Json.createObjectBuilder().add("message", username + " : " + message).build();
		JsonObject jsonObject = Json.createObjectBuilder().add("message",  message).build();
		StringWriter stringwriter = new StringWriter();

		try (JsonWriter jsonWriter = Json.createWriter(stringwriter)) {
			jsonWriter.write(jsonObject);
		}
		;
		return stringwriter.toString();
	}
}
