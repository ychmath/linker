package com.linker.ticket.dto;

import lombok.Data;

@Data
public class TicketTypeDto extends TicketOrderDto{

	private String tickettypename;
	private int price;
	
}
