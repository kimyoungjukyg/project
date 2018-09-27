package com.KL.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KL.member.vo.CommentVO;
import com.KL.member.vo.KLVO;


@Repository
public class GesipanDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	public List<KLVO> gesipanlist() {
		
		return sqlSession.selectList("kl.gesipanlist");
	}

	public KLVO gesipanView(int Rid) {

		return sqlSession.selectOne("kl.gesipanview",Rid);
	}

	public void increaseHit(int Rid) {
		sqlSession.update("kl.increaseHit",Rid);
		 
	}

	public int gesipanwrite(KLVO klvo) {
		
		return sqlSession.insert("kl.gesipanwrite",klvo);
	}
	

	//글 수정 업데이트
	public int gesipanmodifyer(KLVO klvo) {
		return sqlSession.update("kl.gesipanmodifyer", klvo);
	}

	public void gesipandelete(int Rid) {
		sqlSession.delete("kl.gesipandelete",Rid);
		
	}

	public int gesipanrelpy(CommentVO comvo) {
		return sqlSession.insert("Com.gesipanreply",comvo);
	}

	

	public List<CommentVO> replyList() {
		return sqlSession.selectList("Com.replyList");
	}

	public List<CommentVO> replyView(int Rid) {
		return sqlSession.selectList("Com.replyView",Rid);
	}		


}
