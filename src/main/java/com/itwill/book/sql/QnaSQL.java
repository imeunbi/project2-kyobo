package com.itwill.book.sql;

public class QnaSQL {
	public static final String QNA_INSERT = "insert into qna (q_no, q_class, q_title, q_contents, u_id, q_groupno, q_step, q_depth) values(qna_q_no_seq.nextval, ?, ?, ?, ?, qna_q_no_seq.currval, 1, 0)";
	public static final String QNA_UPDATE = "update qna set q_class=?, q_title=?, q_contents=? where q_no=? and u_id=?";
	public static final String QNA_DELETE_BY_NO_ID = "delete qna where q_no=? and u_id=?";
	public static final String QNA_SELECT_BY_NO = "select * from qna where q_no=?";
	
	
	public static final String QNA_REPLY_UPDATE = "update qna set q_step = q_step+1 where q_step>? and q_groupno = ?";
	public static final String QNA_REPLY_INSERT = "insert into qna (q_no, q_class, q_title, q_contents, u_id, q_groupno, q_step, q_depth) values(qna_q_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
	
	
	public static final String QNA_SELECT_ALL = "select * from (select ROWNUM idx, s.* from (select * from qna ORDER BY q_groupno DESC, q_step ASC)s)WHERE idx >= ? AND idx <= ?";
	public static final String QNA_SELECT_BY_ID_START_LAST = "select * from (select ROWNUM idx, s.* from (select * from qna ORDER BY q_groupno DESC, q_step ASC)s)WHERE u_id=? and idx >= ? AND idx <= ?";
	
	
	public static final String SELECT_QNA_REPLY_COUNT = "select count(*)-1 from qna";
}
