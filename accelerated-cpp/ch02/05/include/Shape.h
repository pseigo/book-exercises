#ifndef SHAPE_H
#define SHAPE_H

#include <iostream>
#include <string>

using std::cin; using std::cout; using std::cerr; using std::endl;
using std::string;

class Shape
{
public:
    void printShape(string, char, int, int, bool);
    void setSolidFill(bool);
    void setSymbol(char);
protected:
    bool _solidFill;
    char _symbol;
};

class Rectangle : public Shape
{
public:
    // constructors
    Rectangle();
    Rectangle(char, bool, int, int);
    void reset();

    void setWidth(int);
    void setHeight(int);

    void print();
private:
    int _width;
    int _height;
};

class Triangle : public Shape
{
public:
    // constructors
    Triangle();
    Triangle(char, bool, int);
    void reset();

    void setHeight(int);

    void print();
private:
    int _height;
};

#endif // SHAPE_H
