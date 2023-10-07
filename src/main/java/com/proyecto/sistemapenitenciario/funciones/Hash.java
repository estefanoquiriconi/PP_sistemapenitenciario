package com.proyecto.sistemapenitenciario.funciones;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * La clase Hash proporciona métodos para generar un hash utilizando el
 * algoritmo SHA-256.
 */
public class Hash {

    /**
     * Genera un hash SHA-256 a partir de una cadena de entrada.
     *
     * @param input La cadena de entrada para la cual se calculará el hash.
     * @return Una representación hexadecimal del hash SHA-256 generado.
     */
    public String generarHash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(input.getBytes(StandardCharsets.UTF_8));

            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
