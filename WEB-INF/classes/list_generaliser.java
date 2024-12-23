package fonctions;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import Objet.Etudiants;

public class list_generaliser {
    private Object objet;

    public Object getObjet() {
        return objet;
    }

    public void setObjet(Object objet) {
        this.objet = objet;
    }

    public list_generaliser(Object objet) {
        this.objet = objet;
    }

    public String list() throws Exception {

        StringBuilder html = new StringBuilder();

        Class<?> class1 = this.objet.getClass();
        Method[] me = class1.getMethods();
        Vector vect_method = new Vector<>();

        for (int i = 0; i < me.length; i++) {
            if (me[i].getName().startsWith("get") && me[i].getName() != "getConnection"
                    && me[i].getName() != "getNom_table" && me[i].getName() != "getClass") {
                vect_method.add(me[i]);
            }
        }

        String[] nom_colonne = new String[vect_method.size()];
        for (int i = 0; i < nom_colonne.length; i++) {
            Method method = (Method) vect_method.get(i);
            nom_colonne[i] = method.getName().substring(3, method.getName().length());
        }

        html.append("<table border=1>");
        html.append("<tr>");
        for (int i = 0; i < nom_colonne.length; i++) {
            html.append("<th>" + nom_colonne[i] + "</th>");
        }

        html.append("</tr>");

        Class obj_class = objet.getClass();

        Method connection = obj_class.getMethod("getConnection");

        Connection c = null;

        Object oTemp = new Object();
        oTemp = connection.invoke(objet);

        c = (Connection) oTemp;

        Method method_nom_table = obj_class.getMethod("getNom_table");
        String nom_table = null;

        nom_table = (String) method_nom_table.invoke(objet);
        double totale_double = 0.0;
        int totale_int = 0;
        double moyenne_double = 0.0;
        double moyenne_int = 0;

        int count = 0;
        Vector vect_totale_double = new Vector<>();
        Vector vect_totale_int = new Vector<>();
        Vector vect_moyenne_double = new Vector<>();
        Vector vect_moyenne_int = new Vector<>();

        // Vector vect_count_int = new Vector<>();
        // Vector vect_count_double = new Vector<>();
        for (int i = 0; i < nom_colonne.length; i++) {
            Method methodTemp = (Method) vect_method.get(i);
            if (methodTemp.getReturnType().getName().equals(int.class.getName())) {
                int intTemp = 0;
                double doubleTemp = 0.0;
                vect_totale_int.add(intTemp);
                vect_moyenne_int.add(doubleTemp);
                // vect_count_int.add(intTemp);
            }

            if (methodTemp.getReturnType().getName().equals(double.class.getName())) {
                double doubleTemp = 0.0;
                int intTemp = 0;
                vect_totale_double.add(doubleTemp);
                vect_moyenne_double.add(doubleTemp);
                // vect_count_double.add(intTemp);
            }
        }
        try (Statement stm = c.createStatement()) {
            String sql_get_elements = "select * from " + nom_table + "";

            try (ResultSet rs = stm.executeQuery(sql_get_elements)) {

                while (rs.next()) {
                    html.append("<tr>");
                    int index_double = 0;
                    int index_int = 0;
                    for (int i = 0; i < nom_colonne.length; i++) {
                        Method methodTemp = (Method) vect_method.get(i);
                        if (methodTemp.getReturnType().getName().equals(int.class.getName())) {
                            html.append("<td> " + rs.getInt(nom_colonne[i]) + " </td>");
                            int totale_int_temp = (int) vect_totale_int.get(index_int);
                            vect_totale_int.set(index_int, totale_int_temp + rs.getInt(nom_colonne[i]));
                            index_int++;

                        }

                        if (methodTemp.getReturnType().getName().equals(double.class.getName())) {
                            html.append("<td> " + rs.getDouble(nom_colonne[i]) + " </td>");
                            double totale_double_temp = (double) vect_totale_double.get(index_double);
                            vect_totale_double.set(index_double, totale_double_temp + rs.getDouble(nom_colonne[i]));
                            index_double++;
                        }

                        if (methodTemp.getReturnType().getName().equals(String.class.getName())) {
                            html.append("<td> " + rs.getString(nom_colonne[i]) + " </td>");

                        }
                    }
                    html.append("</tr>");
                    count++;
                }
                html.append("<tr>");
                int index_double = 0;
                int index_int = 0;
                for (int i = 0; i < nom_colonne.length; i++) {
                    Method methodTemp = (Method) vect_method.get(i);
                    if (methodTemp.getReturnType().getName().equals(int.class.getName())) {
                        int totale_int1 = (int) vect_totale_int.get(index_double);
                        html.append("<td> " + totale_int1 + " </td>");
                        index_int++;
                    }

                    if (methodTemp.getReturnType().getName().equals(double.class.getName())) {
                        double totale_double1 = (double) vect_totale_double.get(index_double);
                        html.append("<td> " + totale_double1 + " </td>");
                        index_double++;

                    }

                    if (methodTemp.getReturnType().getName().equals(String.class.getName())) {
                        html.append("<td> Vide </td>");

                    }

                }
                html.append("<td>Totale</td>");
                html.append("</tr>");
                html.append("<tr>");
                int index_double1 = 0;
                int index_int1 = 0;
                for (int i = 0; i < nom_colonne.length; i++) {
                    Method methodTemp = (Method) vect_method.get(i);
                    if (methodTemp.getReturnType().getName().equals(int.class.getName())) {
                        int totale_int1 = (int) vect_totale_int.get(index_int1);
                        double moyenne_int1 = totale_int1 / count;
                        html.append("<td> " + moyenne_int1 + " </td>");
                        index_int1++;
                    }

                    if (methodTemp.getReturnType().getName().equals(double.class.getName())) {
                        double totale_double1 = (double) vect_totale_double.get(index_double1);
                        double moyenne_double1 = totale_double1 / count;
                        html.append("<td> " + moyenne_double1 + " </td>");
                        index_double1++;
                    }

                    if (methodTemp.getReturnType().getName().equals(String.class.getName())) {
                        html.append("<td> Vide </td>");

                    }

                }
                html.append("<td>Moyenne</td>");
                html.append("</tr>");
            }

            stm.close();
        } catch (Exception e) {
            // TODO: handle exception
        }
        html.append("</table>");

        return html.toString();
    }

    public Vector list_obj() throws Exception {

        Class clazz = this.objet.getClass();

        Method me_çonnection = clazz.getDeclaredMethod("getConnection");

        Object connectionTemp = new Object();

        connectionTemp = me_çonnection.invoke(this.objet);

        Connection connection = (Connection) connectionTemp;
        String nom_table;
        int taille_obj = 0;
        try (Statement stm = connection.createStatement()) {
            Object NomTableObj = new Object();
            NomTableObj = clazz.getDeclaredMethod("getNom_table").invoke(this.objet);
            nom_table = (String) NomTableObj;

            String sql_isa = "select count(*) as isa  from " + nom_table;
            ResultSet rs_isa = stm.executeQuery(sql_isa);
            if (rs_isa.next()) {
                taille_obj = rs_isa.getInt("isa");
            }
            stm.close();
        }
        Object[] valiny = new Object[taille_obj];
        Vector vect_method1 = new Vector<>();
        for (int i = 0; i < clazz.getMethods().length; i++) {
            if (clazz.getMethods()[i].getName().startsWith("set")) {
                vect_method1.add(clazz.getMethods()[i]);
            }
        }
        Vector vect_method2 = new Vector<>(); // Methode misy le tsy misy anle setConnection sy setNom_Table

        for (int i = 0; i < vect_method1.size(); i++) {
            Method meTemp = (Method) vect_method1.get(i);
            if (meTemp.getName() != "setConnection" && meTemp.getName() != "setNom_table") {
                vect_method2.add(meTemp);

            }
        }

        String[] nom_colonnes = new String[vect_method2.size()];
        for (int i = 0; i < nom_colonnes.length; i++) {
            Method me = (Method) vect_method2.get(i);
            nom_colonnes[i] = me.getName().substring(3);
        }

        Vector vect_valiny = new Vector<>();

        try (Statement stm = connection.createStatement()) {
            String sql = "select * from " + nom_table;

            ResultSet rs_obj = stm.executeQuery(sql);
            while (rs_obj.next()) {
                Object oTemp = this.objet.getClass().getDeclaredConstructor().newInstance();
                for (int i = 0; i < nom_colonnes.length; i++) {

                    // System.err.println("test :" + nom_colonnes[i]);
                    Method me = (Method) vect_method2.get(i);
                    if (me.getParameterTypes()[0].equals(int.class)) {
                        me.invoke(oTemp, rs_obj.getInt(nom_colonnes[i]));

                    }

                    if (me.getParameterTypes()[0].equals(double.class)) {
                        me.invoke(oTemp, rs_obj.getDouble(nom_colonnes[i]));
                    }

                    if (me.getParameterTypes()[0].equals(float.class)) {
                        me.invoke(oTemp, rs_obj.getFloat(nom_colonnes[i]));
                    }
                    if (me.getParameterTypes()[0].equals(String.class)) {
                        // System.err.println("Resultset :" + rs_obj.getString(nom_colonnes[i]));
                        me.invoke(oTemp, rs_obj.getString(nom_colonnes[i]));

                    }

                }

                vect_valiny.add(oTemp);

            }

        }

        return vect_valiny;
    }

    public String list2(Vector list) throws Exception {
        StringBuilder html = new StringBuilder();
        Class cl = list.get(0).getClass();
        Vector vect_me = new Vector<>();
        Method[] me = cl.getDeclaredMethods();

        for (int i = 0; i < me.length; i++) {
            if (me[i].getName().startsWith("get")) {
                vect_me.add(me[i]);
            }
        }
        Vector vect_get = new Vector<>();

        for (int i = 0; i < vect_me.size(); i++) {
            Method meTemp = (Method) vect_me.get(i);
            if (meTemp.getName() != "getClass" && meTemp.getName() != "getConnection"
                    && meTemp.getName() != "getNom_table") {
                vect_get.add(meTemp);
                System.err.println("TEMP :" + meTemp.getName());
            }
        }

        html.append("<table border = 1>");
        html.append("<tr>");
        for (int i = 0; i < vect_get.size(); i++) {
            Method meTemp = (Method) vect_get.get(i);
            html.append("<th>" + meTemp.getName().substring(3) + "</th>");
        }

        html.append("</tr>");
        for (int i = 0; i < list.size(); i++) {
            html.append("<tr>");
            for (int j = 0; j < vect_get.size(); j++) {
                Method meTemp = (Method) vect_get.get(j);
                html.append("<td>" + meTemp.invoke(list.get(i)) + "</td>");
            }
            html.append("</tr>");
        }
        html.append("</table>");
        return html.toString();
    }

}
