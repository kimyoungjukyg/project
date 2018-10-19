package com.KL.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KL.member.vo.MemberVO;
import com.KL.member.vo.PtVO;

@Repository
public class PtDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberVO ptView(String id) {
		return sqlSession.selectOne("Member.ptView",id);
	}

	public List<PtVO> callender(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Pt.callender",id);
	}

	public int ptmake(PtVO ptVo) {
		return sqlSession.insert("Pt.ptmake",ptVo);
	}

	public void increaseHit(String id) {
	sqlSession.update("Pt.increaseHit",id);
		
	}

	public PtVO ptr(PtVO ptVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Pt.ptr",ptVO);
	}

	public PtVO ptup(PtVO ptVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Pt.ptup", ptVO);
	}

	public int addpt(PtVO ptVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Pt.addpt",ptVO);}

	public void increase(String title) {
		sqlSession.update("Pt.increase",title);
		
	}

	public PtVO cardtest(PtVO ptVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Pt.cardtest", ptVO);
	}

	public List<PtVO> ptList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Pt.ptList",id);
	}

	public PtVO reptmake(PtVO ptVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Pt.reptmake",ptVO);
	}

	public int ptremake(PtVO ptVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("Pt.ptremake", ptVO);
	}

	public void ptdelete(int log) {
		sqlSession.delete("Pt.ptdelete",log);
		
	}

	public List<PtVO> ptoff(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Pt.ptoff",id);
	}

	public void ptcancel(String title) {
		sqlSession.delete("Pt.ptcancel",title);
		
	}

	public List<PtVO> relistview(String id) {
		
		return sqlSession.selectList("Pt.relistview",id);
	}

	public PtVO gesipanview2(int rid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Pt.gesipanview2",rid);
	}

	

	

	
	

	

	
	

}
