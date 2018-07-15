//
//  InfoViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/11/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBAction func didClickOnSearchIcon(_ sender: Any) {
        tabBarController?.selectedIndex = 1

    }
    
    @IBOutlet weak var algorithmTableView: UITableView!

    private let algorithmCollection : [Algorithm] = [
        Algorithm(name: "Bubble Sort",     algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(n²)", 10),    worstCase: ("O(n²)", 10),        memory: "O(1)",      info: "Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps through the list to be sorted, compares each pair of adjacent items and swaps them if they are in the wrong order. The pass through the list is repeated until no swaps are needed, which indicates that the list is sorted. The algorithm, which is a comparison sort, is named for the way smaller or larger elements bubble to the top of the list."),
        Algorithm(name: "Selection Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10),   averageCase: ("O(n²)", 10),    worstCase: ("O(n²)", 10),        memory: "O(1)",     info: "The selection sort algorithm sorts an array by repeatedly finding the minimum element (considering ascending order) from unsorted part and putting it at the beginning. The algorithm maintains two subarrays in a given array. 1) The subarray which is already sorted. 2) Remaining subarray which is unsorted. In every iteration of selection sort, the minimum element (considering ascending order) from the unsorted subarray is picked and moved to the sorted subarray."),
        Algorithm(name: "Insertion Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(n²)", 10),    worstCase: ("O(n²)", 10),        memory: "O(n²)",     info: "Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time."),
        Algorithm(name: "Heap Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(nlogn)", 6),  worstCase: ("O(nlogn)", 6),      memory: "O(1)",      info: "The heapsort algorithm involves preparing the list by first turning it into a max heap. The algorithm then repeatedly swaps the first value of the list with the last value, decreasing the range of values considered in the heap operation by one, and sifting the new first value into its position in the heap. This repeats until the range of considered values is one value in length."),
        Algorithm(name: "Cocktail Sort",   algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(n²)", 10),    worstCase: ("O(n²)", 10),        memory: "O(1)",      info: "Cocktail shaker sort, also known as bidirectional bubble sort, cocktail sort, shaker sort (which can also refer to a variant of selection sort), ripple sort, shuffle sort, or shuttle sort, is a variation of bubble sort that is both a stable sorting algorithm and a comparison sort. The algorithm differs from a bubble sort in that it sorts in both directions on each pass through the list. This sorting algorithm is only marginally more difficult to implement than a bubble sort, and solves the problem of turtles in bubble sorts."),
        Algorithm(name: "Block Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(nlogn)", 6),  worstCase: ("O(nlogn)", 6),      memory: "O(1)",      info: "Block sort, or block merge sort, is a sorting algorithm combining at least two merge operations with an insertion sort to arrive at O(n log n) in-place stable sorting. It gets its name from the observation that merging two sorted lists, A and B, is equivalent to breaking A into evenly sized blocks, inserting each A block into B under special rules, and merging AB pairs."),
        Algorithm(name: "Merge Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(nlogn)", 6), averageCase: ("O(nlogn)", 6),  worstCase: ("O(nlogn)", 6),      memory: "O(n)",      info: "Merge sort (also commonly spelled mergesort) is an efficient, general-purpose, comparison-based sorting algorithm. Most implementations produce a stable sort, which means that the implementation preserves the input order of equal elements in the sorted output. Merge sort is a divide and conquer algorithm that was invented by John von Neumann in 1945."),
        Algorithm(name: "Quick Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(nlogn)", 6), averageCase: ("O(nlogn)", 6),  worstCase: ("O(n²)", 10),        memory: "O(log(n))", info: "Quicksort (sometimes called partition-exchange sort) is an efficient sorting algorithm, serving as a systematic method for placing the elements of an array in order."),
        Algorithm(name: "Cube Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(nlogn)", 6),  worstCase: ("O(nlogn)", 6),      memory: "O(n)",      info: "Cubesort's algorithm uses a specialized binary search on each axis to find the location to insert an element. When an axis grows too large it is split. Locality of reference is optimal as only four binary searches are performed on small arrays for each insertion. By using many small dynamic arrays the high cost for insertion on single large arrays is avoided."),
        Algorithm(name: "Counting Sort",   algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(n+r)", 2),    worstCase: ("O(n+r)", 2),        memory: "O(n+r)",    info: "Counting sort is an algorithm for sorting a collection of objects according to keys that are small integers; that is, it is an integer sorting algorithm. It operates by counting the number of objects that have each distinct key value, and using arithmetic on those counts to determine the positions of each key value in the output sequence. Its running time is linear in the number of items and the difference between the maximum and minimum key values, so it is only suitable for direct use in situations where the variation in keys is not significantly greater than the number of items. However, it is often used as a subroutine in another sorting algorithm, radix sort, that can handle larger keys more efficiently."),
        Algorithm(name: "Radix Sort",      algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(n(k/d))", 3), worstCase: ("O(n(k/d))", 3),     memory: "O(n+2ᵈ)",   info: "A Least significant digit (LSD) Radix sort is a fast stable sorting algorithm which can be used to sort keys in integer representation order. Keys may be a string of characters, or numerical digits in a given 'radix'. The processing of the keys begins at the least significant digit (i.e., the rightmost digit), and proceeds to the most significant digit (i.e., the leftmost digit). The sequence in which digits are processed by an LSD radix sort is the opposite of the sequence in which digits are processed by a most significant digit (MSD) radix sort."),
        Algorithm(name: "Spread Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(n(k/d))", 3), worstCase: ("O(n((k/s)+d))", 4), memory: "O(n+2ᵈ)",   info: "Spreadsort is a sorting algorithm invented by Steven J. Ross in 2002. It combines concepts from distribution-based sorts, such as radix sort and bucket sort, with partitioning concepts from comparison sorts such as quicksort and mergesort. In experimental results it was shown to be highly efficient, often outperforming traditional algorithms such as quicksort, particularly on distributions exhibiting structure and string sorting."),
        Algorithm(name: "Bucket Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(n+r)", 2),    worstCase: ("O(n+r)", 2),        memory: "O(n+r)",    info: "Bucket sort, or bin sort, is a sorting algorithm that works by distributing the elements of an array into a number of buckets. Each bucket is then sorted individually, either using a different sorting algorithm, or by recursively applying the bucket sorting algorithm. It is a distribution sort, a generalization of pigeonhole sort, and is a cousin of radix sort in the most-to-least significant digit flavor. Bucket sort can be implemented with comparisons and therefore can also be considered a comparison sort algorithm. The computational complexity estimates involve the number of buckets."),
        Algorithm(name: "Pigeonhole Sort", algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),     averageCase: ("O(n+2ᵏ)", 5),   worstCase: ("O(n+2ᵏ)", 5),       memory: "O(2ᵏ)",     info: "Pigeonhole sorting is a sorting algorithm that is suitable for sorting lists of elements where the number of elements (n) and the length of the range of possible key values (N) are approximately the same.[1] It requires O(n + N) time. It is similar to counting sort, but differs in that it moves items twice: once to the bucket array and again to the final destination [whereas] counting sort builds an auxiliary array then uses the array to compute each item's final destination and move the item there.")
    ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algorithmCollection.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentAlgorithm = algorithmCollection[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "algorithmCell") as! AlgorithmTableCell
        cell.setAlgorithmLabels(cellData: currentAlgorithm)
        return cell 
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        algorithmTableView.delegate = self
        algorithmTableView.dataSource = self
        algorithmTableView.estimatedRowHeight = 3000
        algorithmTableView.rowHeight = UITableViewAutomaticDimension
        self.algorithmTableView.rowHeight = CGFloat(3000/algorithmCollection.count)
        
    }

   
    
    

    
}
