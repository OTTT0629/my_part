package com.ottt.ottt.controller.workDetailPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
<<<<<<< HEAD
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

=======
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dao.review.ReviewDao;
>>>>>>> 7c5f8d98bb08e6ee1d7eaeaf01c0c8ee7140c260
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.service.review.ReviewService;

@Controller
public class DetailReviewController {

	@Autowired
	ReviewService reviewService;
	
	@GetMapping(value = "/detailPage/review")
	public String workReview(Model m, HttpServletRequest request) {
		
		try {
			List<ReviewDTO> list = reviewService.getReview();
			int count = reviewService.getCount();
			m.addAttribute("list", list);
			m.addAttribute("count", count);
<<<<<<< HEAD
=======
			ReviewDTO dto = new ReviewDTO();
			Integer reviewno = dto.getReview_no();
			m.addAttribute("reviewno", reviewno);
>>>>>>> 7c5f8d98bb08e6ee1d7eaeaf01c0c8ee7140c260
		} catch (Exception e) {	e.printStackTrace();}
		
			return "/workDetailPage/review";		
	}
	
	@PostMapping("/detailPage/review/write")
	public String writeReview(ReviewDTO reviewDTO, RedirectAttributes rattr,
							Model m, HttpSession session) {		
		try {
			if(reviewService.writeReview(reviewDTO) != 1) {
				throw new Exception("Write failed");
			}
			return "redirect:/detailPage/review";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "workDetailPagereview";
		}
	
	
	}
	
<<<<<<< HEAD
=======
	@PostMapping("/detailPage/review/remove")
	public String remove(Integer review_no,RedirectAttributes rattr, HttpSession session, Model m) {
		int user_no = (int) session.getAttribute("user_no");
		
		
		String msg = "DEL_OK";
		
		try {
			if(reviewService.removeReview(review_no, user_no) !=1)
			throw new Exception("Delete failed.");
		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}

		rattr.addFlashAttribute("msg", msg);
		
		
		
		return "redirect:/detailPage/review/";
	}
	
	@PostMapping("/detailPage/review/modify")
	public String modifyReview(ReviewDTO reviewDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		Integer user_no = (Integer) session.getAttribute("user_no");
		
		
		
		
		try {
			Integer review_no = reviewDTO.getReview_no();
					//reviewService.getReviewNo(reviewDTO);
			//Integer review_no = reviewno.getReview_no();
			m.addAttribute("review_no", review_no);
			
			if(reviewService.modifyReview(reviewDTO) != 1)
				throw new Exception("Modify failed");
			
			System.out.println("컨트롤러 실행");
			rattr.addFlashAttribute("msg", "MOD_OK");
			return "redirect:/detailPage/review";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("reviewDTO", reviewDTO);
			m.addAttribute("msg", "MOD_ERR");
			return "redirect:/detailPage/review/";
		}
	}
	
>>>>>>> 7c5f8d98bb08e6ee1d7eaeaf01c0c8ee7140c260
}
