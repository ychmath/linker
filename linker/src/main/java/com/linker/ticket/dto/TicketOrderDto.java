package com.linker.ticket.dto;

import java.util.Date;

import com.linker.login.dto.LoginDto;

import lombok.Data;

@Data
public class TicketOrderDto extends LoginDto{
	
	private int ticketorderid;
	private Date orderdate;
	private String tickettype;
	private int price;
	private int quantity;
	private int totalprice;
	
}
