using Test, Comodo, Comodo.GeometryBasics

@testset "elements2indices" verbose = true begin
    @testset "Tri. faces" begin
        F = Vector{TriangleFace{Int64}}(undef, 3)
        F[1] = TriangleFace{Int64}(9, 4, 1)
        F[2] = TriangleFace{Int64}(1, 5, 9)
        F[3] = TriangleFace{Int64}(1, 8, 5)
        result = elements2indices(F)
        @test sort(result) == [1, 4, 5, 8, 9]
    end

    @testset "Quad. faces" begin
        F = Vector{QuadFace{Int64}}(undef, 6)
        F[1] = QuadFace{Int64}(1, 2, 3, 4)
        F[2] = QuadFace{Int64}(8, 7, 6, 5)
        F[3] = QuadFace{Int64}(5, 6, 2, 1)
        F[4] = QuadFace{Int64}(6, 7, 3, 2)
        F[5] = QuadFace{Int64}(7, 8, 4, 3)
        F[6] = QuadFace{Int64}(8, 5, 1, 4)
        result = elements2indices(F)
        @test sort(result) == [1, 2, 3, 4, 5, 6, 7, 8]
    end
end

@testset "gridpoints" verbose = true begin

    @testset "with 1 vector" begin
        a = Float64[1, 2, 3]

        expected = Point3{Float64}[
            [1.0, 1.0, 1.0],
            [1.0, 1.0, 2.0],
            [1.0, 1.0, 3.0],
            [1.0, 2.0, 1.0],
            [1.0, 2.0, 2.0],
            [1.0, 2.0, 3.0],
            [1.0, 3.0, 1.0],
            [1.0, 3.0, 2.0],
            [1.0, 3.0, 3.0],
            [2.0, 1.0, 1.0],
            [2.0, 1.0, 2.0],
            [2.0, 1.0, 3.0],
            [2.0, 2.0, 1.0],
            [2.0, 2.0, 2.0],
            [2.0, 2.0, 3.0],
            [2.0, 3.0, 1.0],
            [2.0, 3.0, 2.0],
            [2.0, 3.0, 3.0],
            [3.0, 1.0, 1.0],
            [3.0, 1.0, 2.0],
            [3.0, 1.0, 3.0],
            [3.0, 2.0, 1.0],
            [3.0, 2.0, 2.0],
            [3.0, 2.0, 3.0],
            [3.0, 3.0, 1.0],
            [3.0, 3.0, 2.0],
            [3.0, 3.0, 3.0],
        ]

        result = gridpoints(a)

        @test result == expected
    end

    @testset "with 2 vectors" begin
        a = Float64[1, 2, 3]
        b = Float64[2, 3, 5]

        expected = GeometryBasics.Point3{Float64}[
            [1.0, 2.0, 1.0],
            [1.0, 2.0, 2.0],
            [1.0, 2.0, 3.0],
            [1.0, 3.0, 1.0],
            [1.0, 3.0, 2.0],
            [1.0, 3.0, 3.0],
            [1.0, 5.0, 1.0],
            [1.0, 5.0, 2.0],
            [1.0, 5.0, 3.0],
            [2.0, 2.0, 1.0],
            [2.0, 2.0, 2.0],
            [2.0, 2.0, 3.0],
            [2.0, 3.0, 1.0],
            [2.0, 3.0, 2.0],
            [2.0, 3.0, 3.0],
            [2.0, 5.0, 1.0],
            [2.0, 5.0, 2.0],
            [2.0, 5.0, 3.0],
            [3.0, 2.0, 1.0],
            [3.0, 2.0, 2.0],
            [3.0, 2.0, 3.0],
            [3.0, 3.0, 1.0],
            [3.0, 3.0, 2.0],
            [3.0, 3.0, 3.0],
            [3.0, 5.0, 1.0],
            [3.0, 5.0, 2.0],
            [3.0, 5.0, 3.0],
        ]

        result = gridpoints(a, b)

        @test result == expected
    end

    @testset "with 3 vectors" begin
        a = Float64[1, 2, 3]
        b = Float64[2, 3, 5]
        c = Float64[5, 6, 4]

        expected = GeometryBasics.Point3{Float64}[
            [1.0, 2.0, 5.0],
            [1.0, 2.0, 6.0],
            [1.0, 2.0, 4.0],
            [1.0, 3.0, 5.0],
            [1.0, 3.0, 6.0],
            [1.0, 3.0, 4.0],
            [1.0, 5.0, 5.0],
            [1.0, 5.0, 6.0],
            [1.0, 5.0, 4.0],
            [2.0, 2.0, 5.0],
            [2.0, 2.0, 6.0],
            [2.0, 2.0, 4.0],
            [2.0, 3.0, 5.0],
            [2.0, 3.0, 6.0],
            [2.0, 3.0, 4.0],
            [2.0, 5.0, 5.0],
            [2.0, 5.0, 6.0],
            [2.0, 5.0, 4.0],
            [3.0, 2.0, 5.0],
            [3.0, 2.0, 6.0],
            [3.0, 2.0, 4.0],
            [3.0, 3.0, 5.0],
            [3.0, 3.0, 6.0],
            [3.0, 3.0, 4.0],
            [3.0, 5.0, 5.0],
            [3.0, 5.0, 6.0],
            [3.0, 5.0, 4.0],
        ]

        result = gridpoints(a, b, c)

        @test result == expected
    end

    @testset "Equality of several results" begin
        a = Float64[1, 2, 3]

        result1 = gridpoints(a)
        result2 = gridpoints(a, a)
        result3 = gridpoints(a, a, a)

        @test allequal([result1, result2, result3])
    end
end

@testset "interp_biharmonic_spline" verbose = true begin

    @testset "linear / linear" begin
        x = Float64[0.0, 1.0, 2.0, 3.0]
        y = Float64[0.0, 1.0, 0.0, 1.0]
        xi = range(-0.5, 3.5, 9)
        result = interp_biharmonic_spline(x, y, xi; extrapolate_method=:linear, pad_data=:linear)
        true_result = [-0.5, -2.220446049250313e-16, 0.650942317501349,
            0.9999999999999994, 0.501564606542732,
            -2.983724378680108e-16, 0.3537866863312682,
            0.9999999999999997, 1.5]

        eps_level = 0.001

        @test isapprox(result, true_result, atol=eps_level)
    end

    @testset "linear / constant" begin
        x = Float64[0.0, 1.0, 2.0, 3.0]
        y = Float64[0.0, 1.0, 0.0, 1.0]
        xi = range(-0.5, 3.5, 9)
        result = interp_biharmonic_spline(x, y, xi; extrapolate_method=:linear, pad_data=:constant)
        true_result = [0.0, -1.7763568394002505e-15, 0.5861167655113347,
            0.9999999999999998, 0.5015646065427324,
            -2.42861286636753e-16, 0.41861223832128147,
            0.9999999999999993, 1.0]
        eps_level = 0.001
        @test isapprox(result, true_result, atol=eps_level)
    end

    @testset "linear / none" begin
        x = Float64[0.0, 1.0, 2.0, 3.0]
        y = Float64[0.0, 1.0, 0.0, 1.0]
        xi = range(-0.5, 3.5, 9)
        result = interp_biharmonic_spline(x, y, xi; extrapolate_method=:linear, pad_data=:none)
        true_result = [-0.5, -1.1102230246251565e-16, 0.9548390432176067,
            0.9999999999999999, 0.5061519335211898,
            -1.1102230246251565e-16, 0.18162885699253484, 1.0, 1.5]
        eps_level = 0.001
        @test isapprox(result, true_result, atol=eps_level)
    end

    @testset "constant / none" begin
        x = Float64[0.0, 1.0, 2.0, 3.0]
        y = Float64[0.0, 1.0, 0.0, 1.0]
        xi = range(-0.5, 3.5, 9)
        result = interp_biharmonic_spline(x, y, xi; extrapolate_method=:constant, pad_data=:none)
        true_result = [0.0, -1.1102230246251565e-16, 0.9548390432176067,
            0.9999999999999999, 0.5061519335211898,
            -1.1102230246251565e-16, 0.18162885699253484, 1.0, 1.0]
        eps_level = 0.001
        @test isapprox(result, true_result, atol=eps_level)
    end

    @testset "biharmonic / none" begin
        x = Float64[0.0, 1.0, 2.0, 3.0]
        y = Float64[0.0, 1.0, 0.0, 1.0]
        xi = range(-0.5, 3.5, 9)
        result = interp_biharmonic_spline(x, y, xi; extrapolate_method=:biharmonic, pad_data=:none)
        true_result = [-2.3709643220609977, -1.1102230246251565e-16,
            0.9548390432176067, 0.9999999999999999,
            0.5061519335211898, -1.1102230246251565e-16,
            0.1816288569925348, 1.0, 2.801059658186898]
        eps_level = 0.001
        @test isapprox(result, true_result, atol=eps_level)
    end

end

@testset "interp_biharmonic" verbose = true begin
    @testset "3D points 1D data, vectors" begin
        result = interp_biharmonic([[0.0, 0.0, -1.0], [0.0, 0.0, 1.0]], [-10, 10], [[0.0, 0.0, x] for x in range(-1, 1, 5)])
        true_result = [-10.0, -7.449961786934791, 0.0, 7.449961786934791, 10.0]
        eps_level = maximum(eps.(true_result))
        @test isapprox(result, true_result, atol=eps_level)
    end

    @testset "3D points 1D data, geometry basics point vectors" begin
        result = interp_biharmonic(GeometryBasics.Point3{Float64}[[0.0, 0.0, -1.0], [0.0, 0.0, 1.0]], [-10, 10],
            [GeometryBasics.Point3{Float64}(0.0, 0.0, x) for x in range(-1, 1, 5)])
        true_result = [-10.0, -7.449961786934791, 0.0, 7.449961786934791, 10.0]
        eps_level = maximum(eps.(true_result))
        @test isapprox(result, true_result, atol=eps_level)
    end

end

Ci = interp_biharmonic([[0.0, 0.0, -1.0], [0.0, 0.0, 1.0]], [-10, 10], [[0.0, 0.0, x] for x in range(-1, 1, 3)])

@testset "dist" verbose = true begin

    @testset "vector to vector" begin
        v1 = Float64[0, 0, 0]
        v2 = Float64[0, 0, 5]
        result = dist(v1, v2)
        @test result == [0.0 0.0 5.0; 0.0 0.0 5.0; 0.0 0.0 5.0]
    end

    @testset "vectors to vector" begin 
        eps = 0.001
        v1 = [[1, 2, 3], [0, 0, 0]]
        v2 = [0, 0, 0]
        result = dist(v1, v2)
        @test result isa Matrix
        @test isapprox(result, [3.7416573867739413; 0.0;;], atol = eps)
    end 

    @testset "vector to vectors" begin 
        eps = 0.001
        v1 = [[1, 2, 3], [0, 0, 0]]
        v2 = [0, 0, 0]
        result = dist(v2, v1)
        @test result isa Matrix
        @test isapprox(result, [3.7416573867739413 0.0], atol = eps)
    end 

    @testset "vector of points to vector of points" begin
        V1 = Vector{GeometryBasics.Point{3,Float64}}(undef, 4)
        V1[1] = GeometryBasics.Point{3,Float64}(1.0, 0.0, 0.0)
        V1[2] = GeometryBasics.Point{3,Float64}(0.0, 1.0, 0.0)
        V1[3] = GeometryBasics.Point{3,Float64}(0.0, 0.0, 1.0)
        V1[4] = GeometryBasics.Point{3,Float64}(1.0, 1.0, 1.0)

        V2 = Vector{GeometryBasics.Point{3,Float64}}(undef, 3)
        V2[1] = GeometryBasics.Point{3,Float64}(π, 0.0, 0.0)
        V2[2] = GeometryBasics.Point{3,Float64}(0.0, π, 0.0)
        V2[3] = GeometryBasics.Point{3,Float64}(0.0, 0.0, π)

        result = dist(V1, V2)
        eps_level = maximum(eps.(result))

        @test isapprox(result, [2.141592653589793 3.296908309475615 3.296908309475615;
                3.296908309475615 2.141592653589793 3.296908309475615;
                3.296908309475615 3.296908309475615 2.141592653589793;
                2.5664019743426345 2.5664019743426345 2.5664019743426345], atol=eps_level)
    end
end



@testset "geosphere(3,1.0)" begin
    F, V = geosphere(3, 1.0)

    @test F isa Vector{TriangleFace{Int64}}
    @test length(F) == 1280

    @test V isa Vector{Point3{Float64}}
    @test length(V) == 642
end

@testset "simplexcenter" begin

    eps = 0.001

    F, V = geosphere(3, 1.0)
    VC = simplexcenter(F, V)

    @test typeof(VC) == Vector{Point3{Float64}}
    @test length(VC) == 1280
    @test isapprox(VC[1], [-0.35520626817942325, 0.0, -0.9299420831107401], atol=eps)

end


@testset "remove_unused_vertices" begin
    F, V = geosphere(3, 1.0)
    VC = simplexcenter(F, V)
    F = [F[i] for i in findall(map(v -> v[3] > 0, VC))] # Remove some faces
    F, V = remove_unused_vertices(F, V)

    @test F isa Vector{TriangleFace{Int64}}
    @test length(F) == 624

    @test V isa Vector{Point3{Float64}}
    @test length(V) == 337
end


@testset "boundaryedges" begin
    F, V = geosphere(3, 1.0)
    VC = simplexcenter(F, V)
    F = [F[i] for i in findall(map(v -> v[3] > 0, VC))] # Remove some faces
    F, V = remove_unused_vertices(F, V)
    Eb = boundaryedges(F)

    @test typeof(Eb) == Vector{LineFace{Int64}}
    @test length(Eb) == 48
    @test Eb[1] == [272, 205]
end

@testset "edges2curve" begin
    F, V = geosphere(3, 1.0)
    VC = simplexcenter(F, V)
    F = [F[i] for i in findall(map(v -> v[3] > 0, VC))] # Remove some faces
    F, V = remove_unused_vertices(F, V)
    Eb = boundaryedges(F)
    ind = edges2curve(Eb)

    @test length(ind) == 49
    @test ind ==
          [272, 205, 329, 168, 309, 184, 270, 145, 306, 220, 334, 223, 305, 138, 320, 204, 292, 232, 336, 234, 311, 203, 269, 115, 303, 194, 321, 133, 312, 207, 271, 164, 308, 209, 330, 231, 307, 154, 327, 206, 301, 240, 335, 229, 310, 196, 304, 208, 272]
end


@testset "circlepoints" begin

    @testset "with value" begin
        V1 = circlepoints(1.0, 40)

        @test V1 isa Vector{Point3{Float64}}
        @test length(V1) == 40
        @test V1[1] == [1.0, 0.0, 0.0]
    end

    @testset "with function" begin
        r = 1.0
        n = 40
        rFun(t) = r + 0.5 .* sin(3 * t)
        V2 = circlepoints(rFun, n)

        @test V2 isa Vector{Point3{Float64}}
        @test length(V2) == 40
        @test V2[1] == [1.0, 0.0, 0.0]
    end

end

@testset "platonicsolid" begin

    eps = 0.001
    M = platonicsolid(4, 1.0) # icosahedron
    @test M isa Mesh{3,Float64,GeometryBasics.Ngon{3,Float64,3,Point3{Float64}},SimpleFaceView{3,Float64,3,Int64,Point3{Float64},TriangleFace{Int64}}}
    @test length(M) == 20
    @test isapprox(M[1][1], [-0.85065080835204, 0.0, -0.5257311121191336], atol=eps)

end

@testset "subtri" begin
    r = 1
    n = 3
    eps = 0.001

    M = platonicsolid(4, r)
    V = coordinates(M)
    F = faces(M)

    Fn, Vn = subtri(F, V, n)

    @test Fn isa Vector{TriangleFace{Int64}}
    @test length(Fn) == 1280
    @test Fn[1] == TriangleFace(163, 323, 243)

    @test Vn isa Vector{Point3{Float64}}
    @test length(Vn) == 642
    @test isapprox(Vn[1], [0.0, -0.5257311121191336, -0.85065080835204], atol=eps)
end

@testset "dist(Vn, V)" begin
    r = 1
    n = 3
    eps = 0.001

    M = platonicsolid(4, r)
    V = coordinates(M)
    F = faces(M)

    _, Vn = subtri(F, V, n)

    DD = dist(Vn, V)

    @test DD isa Matrix{Float64}
    @test size(DD) == (642, 12)
    @test isapprox(DD[1, :], [0.0, 1.70130161670408, 2.0, 1.0514622242382672, 1.0514622242382672, 1.70130161670408, 1.70130161670408, 1.0514622242382672, 1.0514622242382672, 1.0514622242382672, 1.70130161670408, 1.70130161670408], atol=eps)
end

@testset "quadsphere" begin
    r = 1.0
    F, V = quadsphere(3, r)
    eps = 0.001

    @test V isa Vector{Point3{Float64}}
    @test length(V) == 386
    @test isapprox(V[1], [-0.5773502691896258, -0.5773502691896258, -0.5773502691896258], atol=eps)

    @test F isa Vector{QuadFace{Int64}}
    @test length(F) == 384
    @test F[1] == [1, 99, 291, 187]
end

@testset "simplexcenter" begin
    eps = 0.001
    F, V = geosphere(2, 1.0)
    VC = simplexcenter(F, V)

    @test V isa Vector{Point3{Float64}}
    @test length(V) == 162
    @test isapprox(V[1], [0.0, -0.5257311121191336, -0.85065080835204], atol=eps)

    @test F isa Vector{TriangleFace{Int64}}
    @test length(F) == 320
    @test F[1] == TriangleFace(43, 83, 63)
end

@testset "normalizevector" begin
    n = normalizevector(Vec{3,Float64}(0.0, 0.0, 1.0))

    @test n isa Vec3{Float64}
    @test n == [0.0, 0.0, 1.0]
end

@testset "extrude curve" begin
    eps = 0.001
    r = 1
    nc = 16
    d = 3.0
    Vc = circlepoints(r, nc; dir=:cw)
    F, V = extrudecurve(Vc, d; s=1, close_loop=true, face_type=:quad)

    @test V isa Vector{Point3{Float64}}
    @test length(V) == 128
    @test isapprox(V[1], [1.0, 0.0, 0.0], atol=eps)

    @test F isa Vector{QuadFace{Int64}}
    @test length(F) == 112
    @test F[1] == [17, 18, 2, 1]
end

@testset "cube" begin
    r = 2 * sqrt(3) / 2
    M = cube(r)

    @test M isa Mesh{3,Float64,GeometryBasics.Ngon{3,Float64,4,Point3{Float64}},SimpleFaceView{3,Float64,4,Int64,Point3{Float64},QuadFace{Int64}}}
    @test length(M) == 6
    @test M[1][1] == [-1.0, -1.0, -1.0]
    @test M[1][2] == [-1.0, 1.0, -1.0]
    @test M[1][3] == [1.0, 1.0, -1.0]
    @test M[1][4] == [1.0, -1.0, -1.0]
end

@testset "mergevertices" begin
    eps = 0.001
    r = 2 * sqrt(3) / 2
    M = cube(r)

    F = togeometrybasics_faces(faces(M))
    V = togeometrybasics_points(coordinates(M))
    F, V, _ = mergevertices(F, V)

    @test V isa Vector{Point3{Float64}}
    @test length(V) == 8
    @test isapprox(V[1], [-1.0, -1.0, -1.0], atol=eps)

    @test F isa Vector{QuadFace{Int64}}
    @test length(F) == 6
    @test F[1] == [1, 2, 3, 4]
end

@testset "seperate vertices" begin

    eps = 0.001
    r = 2 * sqrt(3) / 2
    M = cube(r)

    F = togeometrybasics_faces(faces(M))
    V = togeometrybasics_points(coordinates(M))
    F, V, _ = mergevertices(F, V)

    Fn, Vn = seperate_vertices(F, V)

    @test Vn isa Vector{Point3{Float64}}
    @test length(Vn) == 24
    @test isapprox(Vn[1], [-1.0, -1.0, -1.0], atol=eps)

    @test Fn isa Vector{QuadFace{Int64}}
    @test length(Fn) == 6
    @test Fn[1] == [1, 2, 3, 4]
end

@testset "icosahedron" begin

    eps = 0.001
    M = icosahedron()

    @test M isa Mesh{3,Float64,GeometryBasics.Ngon{3,Float64,3,Point3{Float64}},SimpleFaceView{3,Float64,3,Int64,Point3{Float64},TriangleFace{Int64}}}
    @test length(M) == 20
    @test isapprox(M[1][1], [-0.85065080835204, 0.0, -0.5257311121191336], atol=eps)
    @test isapprox(M[1][2], [0.0, 0.5257311121191336, -0.85065080835204], atol=eps)
    @test isapprox(M[1][3], [0.0, -0.5257311121191336, -0.85065080835204], atol=eps)

end

@testset "dodecahedron" begin

    eps = 0.001
    M = dodecahedron()


    @test M isa Mesh{3,Float64,GeometryBasics.Ngon{3,Float64,5,Point3{Float64}},SimpleFaceView{3,Float64,5,Int64,Point3{Float64},NgonFace{5,Int64}}}
    @test length(M) == 12
    @test isapprox(M[1][1], [0.0, 0.9341723589627159, 0.35682208977309], atol=eps)
    @test isapprox(M[1][2], [-0.5773502691896258, 0.5773502691896258, 0.5773502691896258], atol=eps)
    @test isapprox(M[1][3], [-0.35682208977309, 0.0, 0.9341723589627159], atol=eps)
end


@testset "interp_biharmonic_spline" begin
    eps = 0.001
    x = range(0, 9, 9) # Interval definition
    y = 5.0 * cos.(x .^ 2 ./ 9.0)
    n = 50
    xi = range(-0.5, 9.5, n) # Interval definition

    yi = interp_biharmonic_spline(x, y, xi; extrapolate_method=:linear, pad_data=:linear)

    expected = Float64[
        5.021936470288651, 5.012982808946344, 5.004029147604038, 5.003883984828356, 5.013423891770618, 5.016926459732009, 5.008877412957425, 4.986252200086639, 4.949095584901485, 4.900712801046797, 4.827338182066324, 4.718702733147323,
        4.565299270988856, 4.355206727041269, 4.0643384202727155, 3.690302768049275, 3.2486120048531575, 2.741142656288753, 2.162741179324234, 1.4930428723452422, 0.6894521660239601, -0.17909936207112054, -1.066850736215498, -1.9394165202437383,
        -2.7620787973653123, -3.4863618240707703, -4.084745304595619, -4.548097090450917, -4.844487814719076, -4.919816101979883, -4.660991193954443, -3.8522496267669797, -2.7401507061437558, -1.4800073431767586, -0.17052435774788544,
        1.0996489364430322, 2.2142992537631168, 3.1162872228104126, 3.812960510488512, 4.267335427319159, 4.415016001115535, 4.129059686282873, 3.1623787726296135, 1.7686560575217602, 0.11532807455604117, -1.6929812437232494, -3.556979551860928,
        -5.26268898629401, -6.833883823784279, -8.405078661274548,
    ]
    @test yi isa Vector{Float64}
    @test length(yi) == 50
    @test isapprox(yi, expected, atol=eps)
end


@testset "evenly_sample" begin

    eps = 0.001

    t = range(0, 2.0 * pi, 20)
    V = [GeometryBasics.Point{3,Float64}(tt, 3.0 * sin(tt), 0.0) for tt ∈ t]

    n = 10
    Vi, S = evenly_sample(V, n; niter=10)

    expected_Vi = Point3{Float64}[[0.0, 0.0, 0.0], [0.5078857273534546, 1.4623904932511307, 0.0], [1.2220360109178459, 2.8294055970804317, 0.0], [2.3306917216175593, 2.1742492209148088, 0.0], [2.8949991860586746, 0.7329115395627461, 0.0], [3.3881861211209148, -0.7329115395627541, 0.0], [3.952493585562025, -2.174249220914806, 0.0], [5.061149296261742, -2.8294055970804295, 0.0], [5.775299579826132, -1.4623904932511285, 0.0], [6.283185307179586, -7.347880794884119e-16, 0.0]]

    @test isapprox(expected_Vi, Vi, atol=eps)

    @test isapprox(S.x, Float64[0.0,
            0.07387312457178799,
            0.1406049609791122,
            0.1942228509486497,
            0.2312834372763779,
            0.2557343423231858,
            0.2850592303664455,
            0.3306740756854293,
            0.3914466853315311,
            0.4626059943694295,
            0.5373940056305698,
            0.6085533146684685,
            0.6693259243145708,
            0.7149407696335541,
            0.7442656576768139,
            0.7687165627236219,
            0.8057771490513501,
            0.8593950390208875,
            0.9261268754282117,
            1.0
        ], atol=eps)

    @test isapprox(S.spline.basis.B.t, Float64[0.0,
            0.0,
            0.0,
            0.0,
            0.07387312457178799,
            0.1406049609791122,
            0.1942228509486497,
            0.2312834372763779,
            0.2557343423231858,
            0.2850592303664455,
            0.3306740756854293,
            0.3914466853315311,
            0.4626059943694295,
            0.5373940056305698,
            0.6085533146684685,
            0.6693259243145708,
            0.7149407696335541,
            0.7442656576768139,
            0.7687165627236219,
            0.8057771490513501,
            0.8593950390208875,
            0.9261268754282117,
            1.0,
            1.0,
            1.0,
            1.0
        ], atol=eps)

    @test isapprox(S.spline.basis.M.left[2], Float64[1.2080446399615536 0.0; 0.7919553600384465 0.5123829689520382; 0.0 1.4876170310479617], atol=eps)

end


@testset "nbezier" begin 

    eps = 0.001
    
    P = Vector{GeometryBasics.Point{3, Float64}}(undef,4)
    P[1 ] = GeometryBasics.Point{3, Float64}( 0.0, 0.0, 0.0)
    P[2 ] = GeometryBasics.Point{3, Float64}( 1.0, 0.0, 0.0)
    P[3 ] = GeometryBasics.Point{3, Float64}( 1.0, 1.0, 0.0)
    P[4 ] = GeometryBasics.Point{3, Float64}( 1.0, 1.0, 1.0)

    n = 25 # Number of points

    V = nbezier(P,n) # Get Bezier fit points

    expected = Point3{Float64}[[0.0, 0.0, 0.0], [0.11986400462962965, 0.005063657407407407, 7.233796296296296e-5], [0.22974537037037032, 0.019675925925925923, 0.0005787037037037037], [0.330078125, 0.04296875, 0.001953125], [0.4212962962962963, 0.07407407407407407, 0.004629629629629629], [0.503833912037037, 0.11212384259259262, 0.009042245370370372], [0.578125, 0.15625, 0.015625], [0.6446035879629629, 0.20558449074074078, 0.024811921296296304], [0.7037037037037037, 0.25925925925925924, 0.037037037037037035], [0.755859375, 0.31640625, 0.052734375], [0.8015046296296295, 0.3761574074074074, 0.07233796296296298], [0.8410734953703705, 0.43764467592592593, 0.09628182870370369], [0.875, 0.5, 0.125], [0.9037181712962963, 0.562355324074074, 0.1589265046296296], [0.9276620370370372, 0.6238425925925928, 0.19849537037037043], [0.947265625, 0.68359375, 0.244140625], [0.9629629629629629, 0.7407407407407407, 0.2962962962962963], [0.9751880787037037, 0.7944155092592593, 0.3553964120370371], [0.984375, 0.84375, 0.421875], [0.9909577546296297, 0.8878761574074074, 0.4961660879629629], [0.9953703703703705, 0.925925925925926, 0.5787037037037038], [0.998046875, 0.95703125, 0.669921875], [0.9994212962962963, 0.9803240740740741, 0.7702546296296295], [0.9999276620370372, 0.9949363425925927, 0.8801359953703706], [1.0, 1.0, 1.0]]
    
    @test typeof(V) == Vector{Point3{Float64}}
    
    @test isapprox(V, expected, atol = eps)

end 

@testset "mindist" begin 
    
    eps = 0.01

    V1 = [[1, 2, 3], [0, 0, 0]]
    V2 = [[4, 5, 6], [0, 0, 0]]

    result = mindist(V1, V2)

    @test result isa Vector{Float64}

    @test isapprox(result, [3.7416573867739413, 0.0], atol = eps)

end 


@testset "unique_dict_index" begin 

    result1, result2 = Comodo.unique_dict_index([1, 2, 3, 3, 3, 4, 4, 4, 5])

    @test result1 == [1, 2, 3, 4, 5]
    @test result2 == [1, 2, 3, 6, 9]

end 


@testset "unique_dict_index_count" begin 

    result1, result2, result3 = Comodo.unique_dict_index_count([1, 2, 3, 3, 3, 4, 4, 4, 5])

    @test result1 == [1, 2, 3, 4, 5]
    @test result2 == [1, 2, 3, 6, 9]
    @test result3 == [1, 1, 3, 3, 1]

end 


@testset "unique_dict_index_inverse_count" begin 

    r1, r2, r3, r4 = Comodo.unique_dict_index_inverse_count([1, 2, 3, 3, 3, 4, 4, 4, 5])

    @test r1 == [1, 2, 3, 4, 5]
    @test r2 == [1, 2, 3, 6, 9]
    @test r3 == [1, 2, 3, 3, 3, 4, 4, 4, 5]
    @test r4 == [1, 1, 3, 3, 1]

end 


@testset "unique_dict_count" begin 

    result1, result2 = Comodo.unique_dict_count([1, 1, 1, 2, 2, 2, 2, 3, 3, 4, 5])

    @test result1 == [1, 2, 3, 4, 5]
    @test result2 == [3, 4, 2, 1, 1]

end


@testset "unique_dict_inverse" begin 

    result1, result2 = Comodo.unique_dict_inverse([1, 1, 1, 2, 2, 2, 2, 3, 3, 4, 5])

    @test result1 == [1, 2, 3, 4, 5]
    @test result2 == [1, 1, 1, 2, 2, 2, 2, 3, 3, 4, 5]

end 

