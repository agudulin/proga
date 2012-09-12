from string import *
import os
import pydot

def main():
    forest = 'z(xy(tp(ui(klm)n)g(abc));w(h(q(j)o);A(BCDE(F));'
    trees = forest.split(';')[:-1]
    stack = list()

    for i, tree in enumerate(trees):
        graph = pydot.Dot(graph_type='graph')
        edges = list()

        for c in tree:
            if c == '(' or c in ascii_letters:
                stack.append(c)
            elif c == ')':
                popped = stack.pop()
                line = list()
                while popped != '(':
                    line.append(popped)
                    popped = stack.pop()
                
                root = stack[-1]
                for x in line:
                    edges.append(pydot.Edge(root, x))
        
        line = list()
        root = ''
        while stack:
            c = stack.pop()
            if c != '(':
                line.append(c)
            elif c == '(':
                root = stack.pop()
        for x in line:
            if root:
                edges.append(pydot.Edge(root, x))

        for edge in edges[::-1]:
            graph.add_edge(edge)

        graph.write_png('tree%s.png' % i)


if __name__ == '__main__':
    main()