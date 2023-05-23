package com.linker.finance.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SalesDto{
    private int ticketorderid;
    private String tickettypename;
    private int quantity;
    private int price;
    private Date orderdate;
}
