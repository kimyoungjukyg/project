package com.KL.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KL.member.vo.CommentVO;
import com.KL.member.vo.VideoVO;


@Repository
public class VideoDAO {
	

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<VideoVO> orderVideo(String muscle) {
		return sqlSession.selectList("Video.orderVideo", muscle);
	}

	public int exeWrite(VideoVO videoVO) {
		return sqlSession.insert("Video.exeWrite", videoVO);
	}

	public VideoVO videoView(int exe_Num) {
		return sqlSession.selectOne("Video.videoView",exe_Num);
	}

	public void videoDelete(int exe_Num) {
		sqlSession.delete("Video.videoDelete", exe_Num);
	}

	public int videoLike(int exe_Num) {
		return sqlSession.update("Video.videoLike", exe_Num);
	}

	public void increaseHit(int exe_Num) {
		sqlSession.update("Video.increaseHit", exe_Num);
	}

	public void videoRelpy(CommentVO comvo) {
		sqlSession.insert("Com.videoReply",comvo);
		
	}

	public List<CommentVO> videoReplyView(int exe_Num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Com.videoReplyView", exe_Num);}

	
	/*public List<commentVO> replyView(int eXE_NUM) {
		return sqlSession.selectList("Video.replyView",eXE_NUM);
	}*/

}
