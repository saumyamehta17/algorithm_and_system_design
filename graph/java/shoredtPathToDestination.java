/*package whatever //do not write package name here */

import java.util.*;
import java.lang.*;
import java.io.*;

class Point{
    int x;
    int y;

    Point(int x, int y){
        this.x = x;
        this.y = y;
    }
}

class QueueNode{
    Point pt;
    int distance;

    QueueNode(Point pt, int dis){
        this.pt = pt;
        this.distance = dis;
    }
}


class GFG {

    static boolean valid(int x, int y, int mtrx[][]){
        int m = mtrx.length;
        int n = mtrx[0].length;

        if(x >= 0 && x < m && y >= 0 && y < n && mtrx[x][y] == 1){
            return true;
        }else{
            return false;
        }
    }

    static int shortestPath(int mtrx[][], Point source, Point destination){
        if(mtrx[source.x][source.y] != 1 || mtrx[destination.x][destination.y] != 1){
            return -1;
        }
        mtrx[source.x][source.y] = 2; // mark visited
        Queue<QueueNode> que = new LinkedList<>();

        que.add(new QueueNode(source, 0));

        while(!que.isEmpty()){
            QueueNode curr = que.remove();
            Point pt = curr.pt;
            int distance = curr.distance;

            if(pt.x == destination.x && pt.y == destination.y){
                return distance;
            }
            mtrx[pt.x][pt.y] = 2;

            //up
            if(valid(pt.x+1, pt.y, mtrx)){
                que.add(new QueueNode(new Point(pt.x+1, pt.y), distance+1));
            }
            // down
            if(valid(pt.x-1, pt.y, mtrx)){
                que.add(new QueueNode(new Point(pt.x-1, pt.y), distance+1));
            }
            //left
            if(valid(pt.x, pt.y-1, mtrx)){
                que.add(new QueueNode(new Point(pt.x, pt.y-1), distance+1));
            }
            //right
            if(valid(pt.x, pt.y+1, mtrx)){
                que.add(new QueueNode(new Point(pt.x, pt.y+1), distance+1));
            }
        }

        return -1;
    }

	public static void main (String[] args) {
		//code
		int mtrx[][] = { {1,0,0,0}, {1,1,0,1}, {0,1,1,1} };
		Point source = new Point(0,0);
		Point destination = new Point(2,3);
		int ans = shortestPath(mtrx, source, destination);
		System.out.println(ans);
	}
}