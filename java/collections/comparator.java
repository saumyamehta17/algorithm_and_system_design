int[][] mat = {{2,1}, {2,0}, {3,0}};
Arrays.sort(mat, new Comparator<>(){
            public int compare(int[] a, int[] b){
                if(a[0] == b[0]) return a[1] - b[1];
                else return a[0] - b[0];
            }
        })

Arrays.sort(mat, (a, b) -> {
                if(a[0] == b[0]) return a[1] - b[1];
                else return a[0] - b[0];
        })

System.out.println(Arrays.toString(mat));