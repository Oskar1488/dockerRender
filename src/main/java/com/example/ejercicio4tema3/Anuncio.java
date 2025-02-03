package com.example.ejercicio4tema3;

public class Anuncio {
    private String nombre;
    private String asunto;
    private String descripcion;

    // Constructores, getters y setters
    public Anuncio(String nombre, String asunto, String descripcion) {
        this.nombre = nombre;
        this.asunto = asunto;
        this.descripcion = descripcion;
    }

    // Getters y setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    // ...
}

