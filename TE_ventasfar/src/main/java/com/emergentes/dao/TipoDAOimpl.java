package com.emergentes.dao;

import com.emergentes.modelo.Tipo;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TipoDAOimpl extends ConexionDB implements TipoDAO {

    @Override
    public void insert(Tipo tipo) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO tipos (descripcion) values (?)");
            ps.setString(1, tipo.getDescripcion());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Tipo tipo) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE tipos SET descripcion = ? where id = ?");
            ps.setString(1, tipo.getDescripcion());
            ps.setInt(2, tipo.getId());
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
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM tipos WHERE id = ?");
            ps.setInt(1,id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Tipo getById(int id) throws Exception {
        Tipo cli = new Tipo();
        try {
            this.conectar();
            
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM tipos WHERE id = ?");
            ps.setInt(1,id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                cli.setId(rs.getInt("id"));
                cli.setDescripcion(rs.getString("descripcion"));
            }
            
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return cli;
    }

    @Override
    public List<Tipo> getAll() throws Exception {
        List<Tipo> lista = null;
        try {
            this.conectar();
            
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM tipos");
            ResultSet rs = ps.executeQuery();
            
            lista = new ArrayList<Tipo>();
            while (rs.next()){
                Tipo cli =  new Tipo();
                
                cli.setId(rs.getInt("id"));
                cli.setDescripcion(rs.getString("descripcion"));
                
                lista.add(cli);
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
