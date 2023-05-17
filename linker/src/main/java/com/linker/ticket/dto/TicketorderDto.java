package com.linker.ticket.dto;

import java.util.Date;

import lombok.Data;

@Data
public class TicketorderDto {
	private String tickettypename;
	private int quantity;
	private Date orderdate;
	

}
