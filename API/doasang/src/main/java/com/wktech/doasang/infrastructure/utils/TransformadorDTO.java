package com.wktech.doasang.infrastructure.utils;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class TransformadorDTO {

    @SuppressWarnings({ "rawtypes", "unchecked" })
	public static List transformar(List<Object[]> records, Class type) {
        List result = new LinkedList();
        for (Object[] record : records) {
            List<Class> tupleTypes = new ArrayList();
            for (Object field : record) {
                // if a field contains null value assign empty string, because in my DTO class
                // types of all constructor parameters are String.
                if (field == null) {
                    field = "";
                }
                tupleTypes.add(field.getClass());
            }
            Constructor ctor;
            try {
                ctor = type.getConstructor(tupleTypes.toArray(new Class[record.length]));
                result.add(ctor.newInstance(record));
            } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException
                    | InstantiationException e) {
                e.printStackTrace();        
                return null;        
            }
        }
        return result;
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
	public static List transformar(List<Object[]> records, Class type, String xx) {
        List listaResultado = new ArrayList<>();

        try {
            Constructor construtor = type.getClass().getConstructor();
            for (Object[] objetoArray : records) {
                Record instancia = (Record) construtor.newInstance();

                for (int i = 0; i < objetoArray.length; i++) {
                    try {
                        type.getClass().getDeclaredField("arg" + i).set(instancia, objetoArray[i]);
                    } catch (NoSuchFieldException e) {
                        // Ignorar caso o campo não exista na classe
                    }
                }

                listaResultado.add(instancia);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaResultado;
    }

    public static <T> List<T> transformarRecord(List<Object[]> records, Class<T> type) {
        List<T> result = new LinkedList<>();
        for (Object[] record : records) {
            Object[] processedRecord = new Object[record.length];
            for (int i = 0; i < record.length; i++) {
                Object field = record[i];
                // if a field contains null value assign empty string or appropriate default value
                if (field == null) {
                    field = getDefaultForType(type.getRecordComponents()[i].getType());
                }
                processedRecord[i] = field;
            }

            try {
                Constructor<T> ctor = type.getDeclaredConstructor(getClasses(processedRecord, type));
                result.add(ctor.newInstance(processedRecord));
            } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException
                    | InstantiationException e) {
                e.printStackTrace();
                return null;
            }
        }
        return result;
    }

    private static Object getDefaultForType(Class<?> type) {
        if (type == Long.class) {
            return 0L;
        } else if (type == Integer.class) {
            return 0;
        } else if (type == String.class) {
            return "";
        } else if (type == Double.class) {
            return 0.0;
        } else if (type == Float.class) {
            return 0.0f;
        } else if (type == Boolean.class) {
            return false;
        }
        return null;
    }

    private static Class<?>[] getClasses(Object[] objects, Class<?> type) {
        Class<?>[] classes = new Class[objects.length];
        for (int i = 0; i < objects.length; i++) {
            //classes[i] = objects[i].getClass();
            classes[i] = getTypeForItem(i, type);
        }
        return classes;
    }

    private static Class<?> getTypeForItem(Integer i, Class<?> type){
        return type.getRecordComponents()[i].getType();
    }
}
