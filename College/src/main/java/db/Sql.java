package db;

public class Sql {
	public static final String INSERT_LECTURE = "INSERT INTO `lecture` SET "
												+ "`lecNo`=?,"
												+ "`lecName`=?,"
												+ "`lecCredit`=?,"
												+ "`lecTime`=?,"
												+ "`lecClass`=? ";
	public static final String INSERT_STUDENT = "INSERT INTO `student` SET "
												+ "`stdNo`=?,"
												+ "`stdName`=?,"
												+ "`stdHp`=?,"
												+ "`stdYear`=?,"
												+ "`stdAddress`=? ";

}
