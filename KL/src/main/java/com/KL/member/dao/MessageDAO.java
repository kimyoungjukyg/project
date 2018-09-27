package com.KL.member.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KL.member.vo.MessageVO;


@Repository
public class MessageDAO {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MessageVO> toMessage(String id) {
		return sqlSession.selectList("Message.messageList", id);
	}

	public int messageWrite(Map map) {
		return sqlSession.insert("Message.messageWrite", map);
	}

	public List<MessageVO> myMessage(String id) {
		return sqlSession.selectList("Message.mymessageList", id) ;
	}

	public void deleteMessage(int num) {
		sqlSession.delete("Message.deleteMessage", num);
	}


	public void contentCheck(int num) {
		sqlSession.update("Message.contentCheck", num);	
	}

	public int count(String id) {
		return sqlSession.selectOne("Message.count", id);
	}

	
}
