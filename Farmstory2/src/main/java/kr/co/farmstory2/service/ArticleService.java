package kr.co.farmstory2.service;

import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.vo.ArticleVO;

public enum ArticleService {
	INSTANCE;
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	
	public ArticleVO selectArticle(String no) {
		return dao.selectArticle(no);
	}
	public ArticleVO selectArticles(String no) {
		return dao.selectArticle(no);
	}
	
	public void updateArticleHit() {}
	

}
