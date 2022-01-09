package ga.udada.udada.member;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageRequestDTO {
	
	private int pageNum;
	private int pageSize;
	
	public PageRequestDTO() {
		this(1,10);
	}

	public PageRequestDTO(int pageNum, int pageSize) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
	}
}
