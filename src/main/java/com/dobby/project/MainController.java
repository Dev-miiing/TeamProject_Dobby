package com.dobby.project;


import com.dobby.project.sun.domain.ProductDCDto;
import com.dobby.project.sun.domain.ProductDto;
import com.dobby.project.sun.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainController {
    @Autowired
    private ProductService productService;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        List<ProductDto> ProductsMain = productService.getMainProducts();
        List<ProductDCDto> Products_DC = productService.Products_DC();


        model.addAttribute("ProductsMain", ProductsMain);
        model.addAttribute("Products_DC", Products_DC);
//        System.out.println(ProductsMain);
//        System.out.println(Products_DC);

        return "main";
    }

}
