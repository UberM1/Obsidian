- costo secuencial, Trabajo(W): costo con un procesador.
- costo paralelo, profundidad(S): costo con ∞ procesadores.


> Las notaciones descriptas a continuacion se las puede pensar como un congunto de funciones por lo que se utilizara $\in$ para indicar que una funcion es de dicho orden.
# NOTACIÓN O
$$f \in O(g) \iff \exists c\in \mathbb{R}, n_0 \in \mathbb{N} /$$
$$\forall n  ≥ n_0 . 0 ≤ f(n) ≤ c ⋅ g(n)$$
La notacion O es una cota superior al crecimiento de la funcion.
# Teorema Maestro
El teorema maestro nos da una regla para el analisis del costo de la mayor parte de las funciones de la forma:
$$
T(n)=a T(n / b)+f(n)
$$

$$
T(n) \in \begin{cases}\Theta\left(n^{\lg _b a}\right) & \text { si } \exists \epsilon>0 . f(n) \in O\left(n^{\left(\lg _b a\right)-\epsilon}\right) \\ \Theta\left(n^{\lg _b a} \lg n\right) & \text { si } f(n) \in \Theta\left(n^{\lg _b a}\right) \\ & \text { si } \exists \epsilon>0 . f(n) \in \Omega\left(n^{\left(\lg _b a\right)+\epsilon}\right) \\ \Theta(f(n)) & \text { y } \exists c<1, N \in \mathbb{N} . \forall n>N . \\ & \text { af }(n / b) \leqslant c f(n)\end{cases}
$$

Los casos se deciden comparando f (n) y n lgb a:
- Caso 1: $n^{lg_b (a)}$ es mas grande. 
- Caso 2: $f(n)$ y  $n^{lg_b (a)}$ tienen el mismo orden.
- Caso 3: $f (n)$ es mas grande

#EstructurasII 