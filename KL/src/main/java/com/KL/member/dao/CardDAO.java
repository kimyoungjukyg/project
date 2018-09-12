package com.KL.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KL.member.vo.CardVO;
import com.KL.member.vo.PtVO;

@Repository
public class CardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int cardlist(CardVO cardVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Card.cardlist",cardVO);
	}

	
	

	public void increase(String id) {
		sqlSession.update("Card.increase",id);
		
	}

	public List<CardVO> cardread(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Card.cardread",id);
	}




	public CardVO cardtest(CardVO cardVO) {
	
		return sqlSession.selectOne("Card.ptpay", cardVO);
	}




	




	

	

	

}
