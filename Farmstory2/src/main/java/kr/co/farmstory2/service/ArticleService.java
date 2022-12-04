package kr.co.farmstory2.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.vo.ArticleVO;

public enum ArticleService {
	INSTANCE;
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	public int insertArticle(ArticleVO article) {
		return dao.insertArticle(article);		
	}
	
	public void insertFile(int parent, String newName, String fname) {
		dao.insertFile(parent, newName, fname);
	}
	
	public ArticleVO selectArticle(String no) {
		return dao.selectArticle(no);
	}
	public List<ArticleVO> selectArticles(String cate, int start) {
		return dao.selectArticles(cate, start);
	}
	
	public void updateArticle(String no, String title, String content) {
		dao.updateArticle(no, title, content);
	}
	
	public void updateArticleHit() {}
	
	public MultipartRequest uploadFile(HttpServletRequest req, String path) throws IOException {
		int maxSize = 1024 * 1024 * 10; // 최대 파일 업로드 허용량 10MB
		return new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	// 현재 페이지는 아무것도 건드리지 않았을때 1 다른 곳으로 이동했으면 값을 받아와서 변환
	public int getCurrentPage(String pg) {
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		
		return currentPage;
	}
	
	//전체 게시물 갯수
		public int selectCountTotal(String search, String cate) {
			int total = 0;
			if(search == null) {
				total = dao.selectCountTotal(cate);
			}else {
				total = dao.selectCountTotalBySearch(search, cate);
			}
			return total;
		}
	
	public int getLastPageNum(int total) {
		
		int lastPageNum = 0;
		
		if(total % 10 == 0) {
			lastPageNum = total / 10;
		}else {
			lastPageNum  = total / 10 + 1;
		}
		
		return lastPageNum;
	}
	
	// 페이지 번호 표시될거,  5면 1~10 43이면 40~50
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {
		int currentPageGroup = (int)Math.ceil(currentPage / 10.0);
		int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
		int pageGroupEnd = currentPageGroup * 10;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		int[] result = {pageGroupStart, pageGroupEnd};
		
		return result;
	}
	
	public int getPageStartNum(int total, int currentPage) {
		int start = (currentPage - 1) * 10;
		return total - start;
	}
	
	public int getStartNum(int currentPage) {
		return (currentPage - 1) * 10;
	}
	
	public String renameFile(ArticleVO vo, String path) {
		// 파일명 수정
		int idx = vo.getFname().lastIndexOf(".");
		String ext = vo.getFname().substring(idx);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+vo.getUid()+ext; // 20221026111323_chhak0503.txt 
		
		File oriFile = new File(path+"/"+vo.getFname());
		File newFile = new File(path+"/"+newName);
		
		oriFile.renameTo(newFile);
		
		return newName;
	}
	

}
