package com.linker.login.dto;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
public class EmailDto {
    private String address;
    private String title;
    private String message;
}