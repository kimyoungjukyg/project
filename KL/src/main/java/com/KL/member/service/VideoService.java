package com.KL.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.KL.member.dao.VideoDAO;
import com.KL.member.vo.CommentVO;
import com.KL.member.vo.VideoVO;


@Service
public class VideoService {

	@Autowired
	private VideoDAO videoDAO;
	private ModelAndView mav;
	private VideoVO videoVO;

	@Autowired
	private HttpSession session;

	/*
	 * public List<Object> orderVideo(HttpServletResponse response, String muscle) {
	 * List<Object> list = null; try { list = videoDAO.orderVideo(muscle);
	 * session.setAttribute("orderVideo", list); } catch (Exception e) {
	 * System.out.println(e.toString()); } return list; }
	 */

	public ModelAndView orderVideo(String muscle, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		videoVO = new VideoVO();
		List<VideoVO> orderVideo = videoDAO.orderVideo(muscle);

		mav.addObject("orderVideo", orderVideo);
		mav.setViewName("video/video");
		// session.setAttribute("orderVideo", orderVideo);
		return mav;
	}

	public ModelAndView exeWrite(VideoVO videoVO, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		String thumbnail = videoVO.getExe_Video();
		System.out.println("thumbnail" + thumbnail);
		thumbnail = thumbnail.substring(17, thumbnail.length());
		videoVO.setYoutube_id(thumbnail);
		int result = videoDAO.exeWrite(videoVO);
		if (result == 0) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 등록 실패!!');");
			out.println("history.go(-1)");// 이전 페이지로 이동!
			out.println("</script>");
		} else {
			mav.setViewName("video/video");
		}

		return mav;
	}

	public ModelAndView videoView(int exe_Num) {
		mav = new ModelAndView();

		VideoVO videoView = videoDAO.videoView(exe_Num);
		mav.addObject("videoView", videoView);
		 List<CommentVO> videoReplyView = videoDAO.videoReplyView(exe_Num);
		 mav.addObject("replyView", videoReplyView);
		mav.setViewName("video/videoView");
		return mav;
	}

	// 글 삭제
	public void videoDelete(int exe_Num, HttpServletResponse response) throws IOException {
		videoDAO.videoDelete(exe_Num);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제되었습니다.');");
		out.println("history.go(-1)");// 이전 페이지로 이동!
		out.println("</script>");
	}

	public void videoLike(int exe_Num, HttpServletResponse response) throws IOException {
		
		videoDAO.videoLike(exe_Num);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('좋아요!');");
		out.println("history.go(-1)");// 이전 페이지로 이동!
		out.println("</script>");
	}

	public void increaseHit(int exe_Num) {
		videoDAO.increaseHit(exe_Num);
		
	}

	public void videoReply(CommentVO comvo) {
		videoDAO.videoRelpy(comvo);
		
	}

	/*
	 * @RequestMapping("customVideo")
	 * 
	 * @ResponseBody public Map<String, Object>
	 * customList(@RequestParam("muscle")String muscle){ List<Map<String,String>>
	 * dataList = new ArrayList<Map<String,String>>(); Map<String, String> data =
	 * null;
	 * 
	 * List<VideoVO> customList = inter.customList(muscle); if(customList.size()==0)
	 * { return null; } for(VideoVO d:customList) { data = new
	 * HashMap<String,String>(); data.put("Exe_Category", d.getExe_Category());
	 * data.put("Exe_Name", d.getExe_Name()); data.put("Exe_Video",
	 * d.getExe_Video()); /*data.put("Exe_Date", d.getExe_Date());
	 * data.put("Exe_Ehits", d.getExe_Ehits()); data.put("Exe_Likecount",
	 * d.getExe_Likecount()); dataList.add(data); }
	 * 
	 * Map<String, Object> customDatas = new HashMap<String,Object>();
	 * customDatas.put("datas", dataList);
	 * 
	 * return customDatas; }
	 */

}