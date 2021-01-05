///usr/bin/env jbang "$0" "$@" ; exit $?

//DEPS com.sparkjava:spark-core:2.9.1

import spark.Spark;

public class main {

    public static void main(String args[]) {
        new main().run();
    }

    void run() {
        Spark.setPort(8080);

        Spark.get("/", (req, res) -> {
            return "Test!";
        });
    }

}
