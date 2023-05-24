package com.linker.ticket.dto;

import java.util.Date;

import lombok.Data;

@Data
public class TicketorderDto {
	
	private int ticketorderid;
	private Date orderdate;
	private String tickettypename;
	private int price;
	private int quantity;
	private int totalprice;
	
}
