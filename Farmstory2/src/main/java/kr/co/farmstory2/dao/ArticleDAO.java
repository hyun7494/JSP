package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.db.DBHelper;
import kr.co.farmstory2.db.Sql;
import kr.co.farmstory2.vo.ArticleVO;

public class ArticleDAO extends DBHelper{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	public void insertArticle() {}
	
	public ArticleVO selectArticle(String no) {
		ArticleVO article = null;
		try {
			logger.info("selectArticle start...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, no);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				article = new ArticleVO();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return article;
	}
	
	public List<ArticleVO> selectArticles(String cate) {
		List<ArticleVO> articles = new ArrayList<>();
		try {
			logger.info("selectArticles start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setString(1, cate);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				ArticleVO article = new ArticleVO();
				article = new ArticleVO();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
				
				articles.add(article);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public void updateArticle() {}
	
	public void updateArticleHit(String no) {
		try{
			logger.info("updateArticleHit start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			
			close();
		}catch(Exception e){
			 logger.error(e.getMessage());
		}
	}
	
	public void deleteArticle() {}
	


}
