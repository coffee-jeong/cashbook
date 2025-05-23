package dto;

public class Cash {
	private int cash_no;
	private int category_no;
	private String cash_date;
	private int amount;
	private String memo;
	private String color;
	private String createdate;
	private String updatedate;
	
	private Category category;

	public void setCategory(Category category) {
		this.category = category;
	}

	public Category getCategory() {
		return this.category;
	}
	
	public int getCash_no() {
		return cash_no;
	}
	public void setCash_no(int cash_no) {
		this.cash_no = cash_no;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getCash_date() {
		return cash_date;
	}
	public void setCash_date(String cash_date) {
		this.cash_date = cash_date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "Cash [cash_no=" + cash_no + ", category_no=" + category_no + ", cash_date=" + cash_date + ", amount="
				+ amount + ", memo=" + memo + ", color=" + color + ", createdate=" + createdate + ", updatedate="
				+ updatedate + "]";
	}
	
	private String kind;

	public String getKind() {
	    return kind;
	}

	public void setKind(String string) {
		// TODO Auto-generated method stub
		
	}

	public void setTitle(String string) {
		// TODO Auto-generated method stub
		
	}

	private String filename; // 필드 추가

	public String getFilename() {
	    return filename;
	}

	public void setFilename(String filename) {
	    this.filename = filename;
	}

	
}
