package db;

public class Sql {
	public static final String INSERT_LECTURE = "insert into `lecture` values (?,?,?,?,?)";
	public static final String INSERT_STUDENT = "INSERT INTO `student` VALUES "
												+ "`stdNo`=?,"
												+ "`stdName`=?,"
												+ "`stdHp`=?,"
												+ "`stdYear`=?,"
												+ "`stdAddress`=? ";

}
