package com.linker.ticket.dto;

import java.util.Date;

import com.linker.login.dto.LoginDto;

import lombok.Data;

@Data
public class TicketOrderDto extends LoginDto{

	private int ticketorderid;
	private int tickettypeid;
	private int quantity;
	private Date orderdate;

}
