package com.KL.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KL.member.vo.CardVO;

@Repository
public class CardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int cardlist(CardVO cardVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Card.cardlist",cardVO);
	}

	public List<CardVO> cardread() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Card.cardread");
	}

}
