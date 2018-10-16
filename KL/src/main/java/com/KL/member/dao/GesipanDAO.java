package com.KL.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KL.member.vo.CommentVO;
import com.KL.member.vo.KLVO;
import com.KL.member.vo.Pagingvo;
import com.KL.member.vo.reVO;


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

	public List<KLVO> gesipanlist2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kl.gesipanlist2");
	}

	public List<CommentVO> replyList2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Com.replyList2"); 
	}

	public List<KLVO> getRead(Pagingvo pagevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kl.getRead", pagevo);
	}

	public int GesipanCount(int count) {
		// TODO Auto-generated method stub
		 return sqlSession.selectOne("kl.getListCount", count);
	}

	public int ReplyLike(CommentVO Comvo) {
		return sqlSession.update("Com.ReplyLike", Comvo);
	}

	
	public int Reviewwrite(reVO revo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Re.Reviewwrite",revo);
	}

	public List<reVO> relist(String tranl) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Re.relist", tranl);
	}

	//검색
		public List<KLVO> searchList(String keyword) {
			return sqlSession.selectList("Search.searchList",keyword);
		}

		public int gesipanmodifyer2(KLVO klvo) {
			// TODO Auto-generated method stub
			return sqlSession.update("kl.gesipanmodifyer2", klvo);
		}

		public int gesipanDeclaration(int Rid) {
			// TODO Auto-generated method stub
			return sqlSession.update("Com.gesipanDeclaration", Rid);
		}


	
	
}
