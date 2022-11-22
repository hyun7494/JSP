package kr.co.jboard2.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.Sql;
import kr.co.jboard2.vo.ArticleVO;

public class ArticleDAO extends DBHelper{
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	public void insertArticle(ArticleVO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getUid());
			psmt.setString(4, vo.getRegip());
			psmt.setString(5, vo.getRdate());
			
			psmt.executeUpdate();
			
			close();
			
			logger.info("insertArticle...");
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}

}
