package org.example.pshandakov.service.impl;

import lombok.RequiredArgsConstructor;
import org.example.pshandakov.model.Product;
import org.example.pshandakov.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }


    public Optional<Product> getProductById(Long id) {
        return productRepository.findById(id);
    }


    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }


    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
}
