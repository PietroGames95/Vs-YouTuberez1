function onEvent(n,v1,v2)
    if n == 'Flash Dissolve' and v1 == 'fast' then
        objectPlayAnimation('flash','dissolveFast',false);
    elseif n == 'Flash Dissolve' then
        objectPlayAnimation('flash','dissolve',false);
    end
end