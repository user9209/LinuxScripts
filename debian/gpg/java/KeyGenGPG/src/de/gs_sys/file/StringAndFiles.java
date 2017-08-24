/*
    Copyright (C) 2017  Georg Schmidt <gs-develop@gs-sys.de>
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

package de.gs_sys.basics.file;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

/**
 * Created by Georg Schmidt on 30.04.2017.
 */
public class StringAndFiles {

    public static String getString(String filename) {
        // Load password length from file
        if (new File(filename).exists()) {
            try {
                return new String(Files.readAllBytes(Paths.get(filename)));
            } catch (Exception ignored) {}
        }
        return null;
    }

    public static boolean toFile(String filename, String content) {
        if (content != null && !content.isEmpty()) {
            try {
                Files.write(
                        Paths.get(filename),
                        content.getBytes(StandardCharsets.UTF_8),
                        StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING, StandardOpenOption.WRITE
                );
                return true;
            } catch (Exception ignored) {}
        }
        return false;
    }

}
