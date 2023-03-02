package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        BreakThread breakThread = new BreakThread();

        Scanner myInput = new Scanner(System.in);
        System.out.print("Enter number of threads: ");
        int threadsCount = myInput.nextInt();
        myInput.close();

        for (int i = 0; i < threadsCount; i += 1) {
            new MainThread(i, breakThread).start();
        }

        new Thread(breakThread).start();
    }
}
