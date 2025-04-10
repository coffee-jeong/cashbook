package dto;

public class Admin {
	private String adminId;
	private String adminpw;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminpw() {
		return adminpw;
	}
	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminpw=" + adminpw + "]";
	}
}
