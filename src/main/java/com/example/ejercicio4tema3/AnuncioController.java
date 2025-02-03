package com.example.ejercicio4tema3;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.ArrayList;
import java.util.List;

@Controller
public class AnuncioController {
    private final List<Anuncio> anuncios = new ArrayList<>();

    @GetMapping("/")
    public String home(HttpSession session, Model model) {
        if (session.getAttribute("bienvenida") == null) {
            model.addAttribute("bienvenida", "¡Bienvenido!");
            session.setAttribute("bienvenida", true);
        }
        model.addAttribute("anuncios", anuncios);
        return "index";
    }

    @GetMapping("/nuevo")
    public String nuevoAnuncio(HttpSession session, Model model) {
        String nombre = (String) session.getAttribute("nombre");
        model.addAttribute("nombre", nombre != null ? nombre : "");
        return "nuevo";
    }

    @PostMapping("/nuevo")
    public String crearAnuncio(@RequestParam String nombre, @RequestParam String asunto,
                               @RequestParam String descripcion, HttpSession session, Model model) {
        anuncios.add(new Anuncio(nombre, asunto, descripcion));
        session.setAttribute("nombre", nombre);
        model.addAttribute("mensaje", "Anuncio creado correctamente");
        return "resultado";
    }

    @GetMapping("/anuncio/{index}")
    public String verAnuncio(@PathVariable int index, Model model) {
        if (index >= 0 && index < anuncios.size()) {
            model.addAttribute("anuncio", anuncios.get(index));
            return "anuncio";
        }
        return "redirect:/";
    }
}

