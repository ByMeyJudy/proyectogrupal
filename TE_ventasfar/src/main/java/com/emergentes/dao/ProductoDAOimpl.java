package com.emergentes.dao;

import com.emergentes.modelo.Producto;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ProductoDAOimpl extends ConexionDB implements ProductoDAO {

    @Override
    public void insert(Producto producto) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO productos (nombre, descripcion, precio,cantidad,fecha,tipo_id) values (?,?,?,?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setFloat(3, producto.getPrecio());
            ps.setInt(4, producto.getCantidad());
            ps.setDate(5, producto.getFecha());
            ps.setInt(6, producto.getTipo_id());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }        
    }

    @Override
    public void update(Producto producto) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE productos SET nombre=?,descripcion=?,precio=?,cantidad=?,fecha=?,tipo_id=? WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setFloat(3, producto.getPrecio());
             ps.setInt(4, producto.getCantidad());
            ps.setDate(5, producto.getFecha());
            ps.setInt(6, producto.getTipo_id());
            
            ps.setInt(7, producto.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }           
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            String sql = "DELETE FROM productos WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1,id );
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }          
    }

    @Override
    public Producto getById(int id) throws Exception {
        Producto pro = new Producto();
        try {
            this.conectar();
            String sql = "SELECT * FROM productos WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setPrecio(rs.getFloat("precio"));
                pro.setCantidad(rs.getInt("cantidad"));
                pro.setFecha(rs.getDate("fecha"));
                pro.setTipo_id(rs.getInt("tipo_id"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }   
        return pro;
    }

    @Override
    public List<Producto> getAll() throws Exception {
        List<Producto> lista = null;
        try {
            this.conectar();
            String sql = "SELECT p.*,t.descripcion as tipo FROM productos p ";
            sql += "LEFT JOIN tipos t ON p.tipo_id = t.id ";
            
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            // Inicializar la colección
            lista = new ArrayList<Producto>();
            while (rs.next()){
                Producto p =  new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getFloat("precio"));
                p.setCantidad(rs.getInt("cantidad"));
                p.setFecha(rs.getDate("fecha"));
                p.setTipo_id(rs.getInt("tipo_id"));
                p.setTipo(rs.getString("tipo"));
                lista.add(p);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }  
        return lista;
    }
    
}
