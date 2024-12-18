package kr.or.iei.member.model.vo;

public class Member {
	
	private String memberNo;
	private String memberId;
	private String memberPw;
	private String memberNickname;
	private String memberPhone;
	private String memberAddr;
	private String memberGender;
	private String memberEmail;
	private String memberType;
	private String enrollDate;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Member(String memberNo, String memberId, String memberPw, String memberNickname, String memberPhone,
			String memberAddr, String memberGender, String memberEmail, String memberType, String enrollDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberNickname = memberNickname;
		this.memberPhone = memberPhone;
		this.memberAddr = memberAddr;
		this.memberGender = memberGender;
		this.memberEmail = memberEmail;
		this.memberType = memberType;
		this.enrollDate = enrollDate;
	}
	
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw
				+ ", memberNickname=" + memberNickname + ", memberPhone=" + memberPhone + ", memberAddr=" + memberAddr
				+ ", memberGender=" + memberGender + ", memberEmail=" + memberEmail + ", memberType=" + memberType
				+ ", enrollDate=" + enrollDate + "]";
	}

	
}