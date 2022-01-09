package ga.udada.udada.recipe;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageRequestDTO {
	
	private int pageNum;
	private int pageSize;
	private String keyword;
	private String loginUser;
	
	public PageRequestDTO() {
		this(1,5,"");
	}

	public PageRequestDTO(int pageNum, int pageSize) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
	}
	
	public PageRequestDTO(int pageNum, int pageSize, String keyword) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
		this.keyword=keyword;
	}
	
	public PageRequestDTO(int pageNum, int pageSize, String keyword, String loginUser) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
		this.keyword=keyword;
		this.loginUser=loginUser;
	}
}
